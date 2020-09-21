from decimal import Decimal

from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Sum
from django.http import HttpResponse
from django.shortcuts import redirect, render, get_object_or_404
from django.views.decorators.csrf import requires_csrf_token

from api.models import Favorite, Purchase, Subscribe
from users.models import User

from .forms import RecipeForm
from .models import Ingredient, IngredientAmount, Recipe, Tag


def filter_tag(request):
    '''Функция готовит общую выборку рецептов в зависимости от тега
    для дальнейшего фильтрования при необходимости.'''
    tags = request.GET.get('tags', 'bds')
    recipe_list = Recipe.objects.prefetch_related(
        'author', 'recipe_tag'
        ).filter(
        recipe_tag__slug__in=tags
        ).distinct(
        ).order_by('-pub_date')
    return recipe_list, tags


def get_tag(tags):
    '''Функция переводит русские названия в английские. Нужна для
    корректного отображения тегов при создании и редактировании рецепта.'''
    tag_dict = {
        'Завтрак': 'breakfast',
        'Обед': 'lunch',
        'Ужин': 'dinner',
    }
    return [tag_dict[item] for item in tags]


def save_recipe(request, form):
    '''Функция сохраняет данные в db при создании и редактировании рецепта.'''
    recipe = form.save(commit=False)
    recipe.author = request.user
    # сохраняем рецепт без тегов и количества ингредиентов
    recipe.save()

    # добавляем теги
    # если делать bulk_create, то не подтянутся цвета
    tags = form.cleaned_data['tag']
    for tag in tags:
        Tag.objects.create(recipe=recipe, title=tag)
    # через bulk_create не подтягиваются цвета тегов
    # objs = [Tag(recipe=recipe, title=tag) for tag in tags]
    # Tag.objects.bulk_create(objs)

    # добавляем количество ингредиентов
    objs = []  # объекты для bulk_create
    for key, value in form.data.items():
        if 'nameIngredient' in key:
            title = value
        elif 'valueIngredient' in key:
            amount = Decimal(value.replace(',', '.'))
        elif 'unitsIngredient' in key:
            dimension = value
            # получаем экземпляр ингредиента
            # и собираем объекты IngredientAmount
            ing = Ingredient.objects.get(title=title, dimension=dimension)
            objs.append(
                IngredientAmount(ingredient=ing, recipe=recipe, amount=amount)
            )
    IngredientAmount.objects.bulk_create(objs)
    return None


def get_ingredients(request):
    '''отправляет пользователю текстовый файл со списком ингредиентов.'''
    # получаем список ингредиентов с их количеством
    ingredient_list = (Recipe.objects.prefetch_related('ingredient', 'recipe_amount')  # noqa
                       .filter(recipe_purchase__user=request.user)
                       .order_by('ingredient__title')
                       .values('ingredient__title', 'ingredient__dimension')
                       .annotate(amount=Sum('recipe_amount__amount')))
    # готовим текстовое сообщения из списка ингредиентов
    ingredient_txt = [
        (f"\u2022 {item['ingredient__title'].capitalize()} "
         f"({item['ingredient__dimension']}) \u2014 {item['amount']} \n")
        for item in ingredient_list
    ]
    filename = 'ingredients.txt'
    # отправляем файл без сохрания на диске
    response = HttpResponse(ingredient_txt, content_type='text/plain')
    response['Content-Disposition'] = f'attachment; filename={filename}'
    return response


def index(request):
    # главная страница редиректит на страницу с рецептами
    return redirect('recipes')


def recipes(request):
    '''Предоставляет список рецептов как для аутентифицированного пользователя
    так и для анонима
    '''
    recipe_list, tags = filter_tag(request)
    paginator = Paginator(recipe_list, 6)
    page_number = request.GET.get('page')
    page = paginator.get_page(page_number)
    template_name = (
        'indexAuth.html'
        if request.user.is_authenticated
        else 'indexNotAuth.html'
    )
    return render(request, template_name, {
            'page': page,
            'paginator': paginator,
            'tags': tags,
            'url': 'recipes',
            'index': 'index',
        },
    )


@login_required
def new_recipe(request):
    '''Создание нового рецепта'''
    if request.method == 'POST':
        form = RecipeForm(request.POST or None, files=request.FILES or None)
        if form.is_valid():
            save_recipe(request, form)
            return redirect('index')
        tags = request.POST.getlist('tag')
        tags = get_tag(tags)
    else:
        form = RecipeForm(request.POST or None)
        tags = []  # при создании рецепта все теги сначала неактивны
    return render(request, 'formRecipe.html',
                  {'form': form, 'tags': tags, 'new': 'new'})


def recipe_view(request, recipe_id):
    '''Страница индивидуального рецепта'''
    recipe = get_object_or_404(Recipe, id=recipe_id)
    template_name = (
        'singlePage.html'
        if request.user.is_authenticated
        else 'singlePageNotAuth.html'
    )
    return render(request, template_name, {'recipe': recipe})


def profile(request, username):
    '''Страница с рецептами одного автора'''
    recipe_list, tags = filter_tag(request)
    recipe_list = recipe_list.filter(author__username=username)
    paginator = Paginator(recipe_list, 6)
    page_number = request.GET.get('page')
    page = paginator.get_page(page_number)
    return render(request, 'authorRecipe.html', {
            'page': page,
            'paginator': paginator,
            'arg': username,
            'tags': tags})


@login_required
def recipe_edit(request, recipe_id):
    '''Редактирование рецепта'''
    recipe = get_object_or_404(Recipe, id=recipe_id)
    # проверка, что текущий юзер и автор рецепта совпадают
    if request.user != recipe.author:
        return redirect('recipe_view', recipe_id=recipe_id)
    if request.method == 'POST':
        form = RecipeForm(request.POST or None,
                          files=request.FILES or None, instance=recipe)
        if form.is_valid():
            # удаляем из рецепта предыдущие данные по инредиентам и
            # их количествам. Так как они заносились не через форму, они
            # не будут заменяться в форме.
            recipe.ingredient.remove()
            recipe.recipe_amount.all().delete()
            recipe.recipe_tag.all().delete()
            save_recipe(request, form)
            return redirect('recipe_view', recipe_id=recipe_id)
        tags = request.POST.getlist('tag')
        tags = get_tag(tags)
    else:
        # нужно вернуть теги из db при запросе GET
        tags_saved = recipe.recipe_tag.values_list('title', flat=True)
        form = RecipeForm(instance=recipe)
        form.fields['tag'].initial = list(tags_saved)
        tags = get_tag(tags_saved)
    return render(
        request, 'formChangeRecipe.html',
        {'form': form, 'recipe': recipe, 'tags': tags})


@login_required
def recipe_delete(request, recipe_id):
    '''Уделение рецепта'''
    recipe = get_object_or_404(Recipe, id=recipe_id)
    if request.user == recipe.author:
        recipe.delete()
        return redirect('profile', username=request.user.username)
    return redirect('index')


@login_required
def favorites(request):
    '''Избранные рецепты пользователя'''
    recipe_list, tags = filter_tag(request)
    # получаем id избранных рецептов пользователя
    favorites = Favorite.objects.filter(user=request.user)
    ids = favorites.values_list('recipe_id', flat=True)
    recipe_list = recipe_list.filter(id__in=ids)
    paginator = Paginator(recipe_list, 6)
    page_number = request.GET.get('page')
    page = paginator.get_page(page_number)
    return render(request, 'favorite.html', {
        'page': page,
        'paginator': paginator,
        'tags': tags,
        'fav': 'fav'})


@login_required
def purchases(request):
    '''Рецепты пользователя в списке покупок'''
    recipe_list, tags = filter_tag(request)
    # получаем id рецептов из списка покупок
    purchases = Purchase.objects.filter(user=request.user)
    ids = purchases.values_list('recipe_id', flat=True)
    recipe_list = recipe_list.filter(id__in=ids)
    return render(
        request, 'shopList.html',
        {'recipe_list': recipe_list, 'tags': tags, 'pur': 'pur'})


@login_required
def subscriptions(request):
    '''Выдает список авторов, на которых подписан пользователь
    и рецептов этих авторов.'''
    author_id_list = Subscribe.objects.filter(
        user=request.user).values_list('author_id', flat=True)
    author_list = (User.objects.prefetch_related('recipe_author')
                   .filter(id__in=author_id_list))
    paginator = Paginator(author_list, 6)
    page_number = request.GET.get('page')
    page = paginator.get_page(page_number)
    return render(
        request, 'myFollow.html',
        {'page': page, 'paginator': paginator, 'sub': 'sub'})


@requires_csrf_token
def page_not_found(request, exception):
    '''Обработчик ошибки 404'''
    return render(request, "misc/404.html", {"path": request.path}, status=404)


@requires_csrf_token
def server_error(request):
    '''Обработчик ошибки 500'''
    return render(request, "misc/500.html", status=500)
