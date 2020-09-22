from django.urls import path

from . import views

urlpatterns = [
    path('recipes/<int:recipe_id>/', views.recipe_view, name='recipe_view'),
    path('recipes/<int:recipe_id>/edit/', views.recipe_edit, name='recipe_edit'),  # noqa
    path('recipes/<int:recipe_id>/delete/', views.recipe_delete, name='recipe_delete'),  # noqa
    path('recipes/new/', views.new_recipe, name='new_recipe'),
    path('recipes/<username>/', views.profile, name='profile'),
    path('recipes/', views.recipes, name='recipes'),
    path('favorites/', views.favorites, name='favorites'),
    path('purchases/', views.purchases, name='purchases'),
    path('subscriptions/', views.subscriptions, name='subscriptions'),
    path('shoplist/', views.get_ingredients, name='shoplist'),
    path('', views.recipes, name='index'),
]
