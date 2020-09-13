from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render

from .models import Recipe, Tag, IngredientAmount, Ingredient
from .forms import RecipeForm


def index(request):
    # главная страница редиректит на страницу с рецептами
    return redirect('recipes')


def recipes(request):
    '''Предоставляет список рецептов как для аутентированного пользователя
    так и для анонима
    '''
    tags = request.GET.get('tags', 1)
    if tags == 1:
        tags = 'bds'
        recipe_list = (
            Recipe.objects.all().select_related('author').order_by('-pub_date')
        )
    else:
        recipe_list = (
            Recipe.objects.select_related('author')
            .filter(recipe_tag__slug__in=tags)
            .distinct()
            .order_by('-pub_date')
        )
    template_name = (
        'indexAuth.html'
        if request.user.is_authenticated
        else 'indexNotAuth.html'
    )
    return render(
        request,
        template_name,
        {'recipe_list': recipe_list, 'tags': tags, 'url': 'recipes'},
    )


@login_required
def new_recipe(request):
    '''Создание нового рецепта'''
    if request.method == 'POST':
        form = RecipeForm(request.POST or None, files=request.FILES or None)
        if form.is_valid():
            recipe = form.save(commit=False)
            recipe.author = request.user
            # сохраняем рецепт без тегов и количества ингредиентов
            recipe.save()
            # добавляем теги
            tags = form.cleaned_data['tag']
            for tag in tags:
                Tag.objects.create(recipe=recipe, title=tag)
            # добавляем количество ингредиентов
            ings = []  # список ингредиентов с количеством
            for key, value in form.data.items():
                if 'Ingredient' in key:
                    ings.append(value)
            objs = []  # собираем объекты IngredientAmount для bulk_create
            for i in range(0, len(ings), 3):
                ingredient = Ingredient.objects.get(  # экземпляр ингредиента
                    title=ings[i], dimension=ings[i + 2]
                )
                objs.append(IngredientAmount(
                        ingredient=ingredient, recipe=recipe, amount=ings[i + 1]  # noqa
                    )
                )
            IngredientAmount.objects.bulk_create(objs)
            return redirect('index')
    else:
        form = RecipeForm(request.POST or None)
    return render(request, 'formRecipe.html', {'form': form})
