from django.urls import path

from . import views

urlpatterns = [
    path('recipes/<int:recipe_id>/', views.recipe_view, name='recipe_view'),
    path('recipes/new/', views.new_recipe, name='new_recipe'),
    path('recipes/<username>/', views.profile, name='profile'),
    path('recipes/', views.recipes, name='recipes'),
    path('', views.index, name='index'),
]
