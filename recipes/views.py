import functools
import operator

from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import get_object_or_404, redirect, render

from .forms import RecipeForm
from .models import Ingredient, IngredientAmount, Recipe, Tag


def index(request):
    # главная страница редиректит на страницу с рецептами
    return redirect('recipes')


def filter_tag(request):
    """Функция готовит общую выборку рецептов в зависимости от тега
    для дальнейшего фильтрования при необходимости.
    """
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


def recipes(request):
    """Предоставляет список рецептов как для аутентированного пользователя
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
        },
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
            # собираем значения из формы, относящиеся к ингредиентам
            title, amount, dimension = [], [], []
            for key, value in form.data.items():
                if 'nameIngredient' in key:
                    title.append(value)
                elif 'valueIngredient' in key:
                    amount.append(value)
                elif 'unitsIngredient' in key:
                    dimension.append(value)
            # собираем список экземпляров ингредиентов
            query = functools.reduce(
                operator.or_,
                (Q(title=t, dimension=d) for t, d in zip(title, dimension)),
            )
            ingredient_list = Ingredient.objects.filter(query)

            # собираем объекты IngredientAmount для bulk_create
            objs = []
            for i in range(len(ingredient_list)):
                objs.append(
                    IngredientAmount(
                        ingredient=ingredient_list[i],
                        recipe=recipe,
                        amount=amount[i],
                    )
                )
            IngredientAmount.objects.bulk_create(objs)
            return redirect('index')
    else:
        form = RecipeForm(request.POST or None)
    return render(request, 'formRecipe.html', {'form': form})


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
        request,
        'authorRecipe.html',
        {'recipe_list': recipe_list, 'arg': username, 'tags': tags},
    )


@login_required
def recipe_edit(request, recipe_id):
    '''Редактирование рецепта'''
    recipe = get_object_or_404(Recipe, id=recipe_id)
    # проверка, что текущий юзер и автор рецепта совпадают
    if request.user == recipe.author:
        if request.method == "POST":
            form = RecipeForm(
                request.POST or None,
                files=request.FILES or None,
                instance=recipe,
            )
            if form.is_valid():
                recipe = form.save(commit=False)
                recipe.author = request.user
                recipe.save()
                return redirect('recipe_view', recipe_id=recipe_id)
                # можно ли убрать else
        else:
            form = RecipeForm(instance=recipe)
        return render(
            request, 'formChangeRecipe.html', {"form": form, "recipe": recipe}
        )
    return redirect('recipe_view', recipe_id=recipe_id)
