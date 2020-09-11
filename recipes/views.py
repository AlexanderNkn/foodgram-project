from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render

from .models import Recipe
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
    if request.method == "POST":
        form = RecipeForm(request.POST or None, files=request.FILES or None)
        if form.is_valid():
            recipe = form.save(commit=False)
            recipe.author = request.user
            recipe.save()
            return redirect("index")
    else:
        form = RecipeForm(request.POST or None)
    return render(request, "formRecipe.html", {"form": form})
