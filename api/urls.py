from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()
router.register('purchases', views.PurchaseViewSet)
router.register('subscriptions', views.SubscribeViewSet)
router.register('favorites', views.FavoriteViewSet)

urlpatterns = [
    path('ingredients/', views.IngredientAPIView.as_view()),
    path('', include(router.urls)),
]
