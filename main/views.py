from django.shortcuts import render

from .models import Recipe


def index(request):
    # главная страница
    recipe_list = Recipe.objects.all()
    return render(request, "indexNotAuth.html", {"recipe_list": recipe_list}, )
