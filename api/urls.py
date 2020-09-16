from django.urls import path

from . import views

urlpatterns = [
    path('ingredients/', views.IngredientAPIView.as_view()),
    path('favorites/', views.FavoriteAdd.as_view()),
    path('favorites/<int:id>/', views.FavoriteDelete.as_view()),
    path('purchases/', views.PurchaseAdd.as_view()),
    path('purchases/<int:id>/', views.PurchaseDelete.as_view()),
    path('subscriptions/', views.SubscribeAdd.as_view()),
    path('subscriptions/<int:id>/', views.SubscribeDelete.as_view()),
]
