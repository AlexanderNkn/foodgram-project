from django.shortcuts import redirect, render

from .models import Recipe


def index(request):
    # главная страница редиректит на страницу с рецептами
    return redirect('recipes')


def recipes(request):
    tags = request.GET.get('tags', 1)
    if tags == 1:
        tags = 'bds'
        recipe_list = Recipe.objects.all().order_by('-pub_date')
    else:
        recipe_list = Recipe.objects.filter(
            recipe_tag__slug__in=tags
        ).distinct().order_by('-pub_date')
    return render(
        request,
        'indexNotAuth.html',
        {
            'recipe_list': recipe_list,
            'tags': tags,
            'url': 'recipes'
        },
    )
