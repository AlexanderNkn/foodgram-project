import functools
import operator
from decimal import Decimal

from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import redirect, render

from api.models import Favorite

from .forms import RecipeForm
from .models import Ingredient, IngredientAmount, Recipe, Tag


def filter_tag(request):
    '''Функция готовит общую выборку рецептов в зависимости от тега
    для дальнейшего фильтрования при необходимости.'''
    tags = request.GET.get('tags', 1)
    if tags == 1:
        tags = 'bds'
        recipe_list = Recipe.objects.prefetch_related(
            'author', 'recipe_tag'
        ).order_by('-pub_date')
    else:
        recipe_list = (
            Recipe.objects.prefetch_related('author', 'recipe_tag')
            .filter(recipe_tag__slug__in=tags)
            .distinct()
            .order_by('-pub_date')
        )
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
    tags = form.cleaned_data['tag']
    for tag in tags:
        Tag.objects.create(recipe=recipe, title=tag)
    # через bulk_create не подтягиваются цвета тегов
    # objs = [Tag(recipe=recipe, title=tag) for tag in tags]
    # Tag.objects.bulk_create(objs)

    # добавляем количество ингредиентов
    # собираем значения из формы, относящиеся к ингредиентам
    title, amount, dimension = [], [], []
    for key, value in form.data.items():
        if 'nameIngredient' in key:
            title.append(value)
        elif 'valueIngredient' in key:
            amount.append(Decimal(value.replace(',', '.')))
        elif 'unitsIngredient' in key:
            dimension.append(value)
    # собираем список экземпляров ингредиентов
    try:
        query = functools.reduce(
            operator.or_,
            (Q(title=t, dimension=d) for t, d in zip(title, dimension)),
        )
        ingredient_list = Ingredient.objects.filter(query)

        # собираем объекты IngredientAmount для bulk_create
        objs = []
        for i in range(len(ingredient_list)):
            objs.append(IngredientAmount(ingredient=ingredient_list[i],
                                         recipe=recipe, amount=amount[i]))
        IngredientAmount.objects.bulk_create(objs)
    except TypeError:
        pass
    return None


def index(request):
    # главная страница редиректит на страницу с рецептами
    return redirect('recipes')


def recipes(request):
    """Предоставляет список рецептов как для аутентифицированного пользователя
    так и для анонима
    """
    recipe_list, tags = filter_tag(request)
    template_name = (
        'indexAuth.html'
        if request.user.is_authenticated
        else 'indexNotAuth.html'
    )
    return render(
        request,
        template_name,
        {
            'recipe_list': recipe_list,
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
    recipe = list(
        Recipe.objects.filter(id=recipe_id).prefetch_related(
            'author',
            'recipe_tag',
        )
    )[0]
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
    return render(
        request, 'authorRecipe.html',
        {'recipe_list': recipe_list, 'arg': username, 'tags': tags},)


@login_required
def recipe_edit(request, recipe_id):
    '''Редактирование рецепта'''
    recipe = list(Recipe.objects.filter(id=recipe_id)
                  .prefetch_related('author', 'recipe_tag'))[0]
    # проверка, что текущий юзер и автор рецепта совпадают
    if request.user != recipe.author:
        return redirect('recipe_view', recipe_id=recipe_id)
    if request.method == "POST":
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
        {"form": form, "recipe": recipe, 'tags': tags})


@login_required
def favorites(request):
    '''Избранные рецепты пользователя'''
    recipe_list, tags = filter_tag(request)
    # получаем id избранных рецептов пользователя
    favorites = Favorite.objects.filter(user=request.user)
    ids = favorites.values_list('recipe_id', flat=True)
    recipe_list = recipe_list.filter(id__in=ids)
    return render(
        request, 'favorite.html',
        {'recipe_list': recipe_list, 'tags': tags, 'fav': 'fav'})
