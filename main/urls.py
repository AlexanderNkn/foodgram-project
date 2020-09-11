from django.urls import path

from . import views

urlpatterns = [
    path("recipes/new/", views.new_recipe, name="new_recipe"),
    path("recipes/", views.recipes, name="recipes"),
    path("", views.index, name="index"),
]
