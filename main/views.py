from django.shortcuts import redirect, render

from .models import Recipe


def index(request):
    # главная страница редиректит на страницу с рецептами
    return redirect('recipes')


def recipes(request):
    recipe_list = Recipe.objects.all()
    return render(request, "indexNotAuth.html", {"recipe_list": recipe_list}, )
