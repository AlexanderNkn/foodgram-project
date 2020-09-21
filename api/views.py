from django.shortcuts import get_object_or_404
from rest_framework import filters, generics
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from recipes.models import Ingredient, Recipe
from users.models import User

from .models import Favorite, Purchase, Subscribe
from .serializers import (FavoriteSerializer, IngredientSerializer,
                          PurchaseSerializer, SubscribeSerializer)


class IngredientAPIView(generics.ListAPIView):
    """Предоставляет поиск в базе ингредиентов по их названиям."""
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['^title', ]


class FavoriteAdd(generics.CreateAPIView):
    """Добавляет рецепт в избранное."""
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        # переопределяет ответ в response для соответствия Api.js
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            return Response({"success": True})
        return Response({"success": False})


class FavoriteDelete(APIView):
    """Удаляет рецепт из избранного."""
    permission_classes = [IsAuthenticated]

    def delete(self, request, id):
        # Api.js присылает id рецепта. По нему нужно
        # удалить объект из Favorite
        recipe = get_object_or_404(Recipe, id=id)
        favorite = recipe.recipe_favorite.filter(user=request.user)
        if favorite:
            favorite.delete()
            return Response({"success": True})
        return Response({"success": False})


class PurchaseAdd(generics.CreateAPIView):
    """Добавляет рецепт в список покупок."""
    queryset = Purchase.objects.all()
    serializer_class = PurchaseSerializer
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            return Response({"success": True})
        return Response({"success": False})


class PurchaseDelete(APIView):
    """Удаляет рецепт из списка покупок."""

    def delete(self, request, id):
        recipe = get_object_or_404(Recipe, id=id)
        purchase = recipe.recipe_purchase.filter(user=request.user)
        if purchase:
            purchase.delete()
            return Response({"success": True})
        return Response({"success": False})


class SubscribeAdd(generics.CreateAPIView):
    """Подписывает пользователя на автора."""
    queryset = Subscribe.objects.all()
    serializer_class = SubscribeSerializer
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            return Response({"success": True})
        return Response({"success": False})


class SubscribeDelete(APIView):
    """Удаляет подписку пользователя на автора."""
    permission_classes = [IsAuthenticated]

    def delete(self, request, id):
        author = get_object_or_404(User, id=id)
        subscribe = author.following.filter(user=request.user)
        if subscribe:
            subscribe.delete()
            return Response({"success": True})
        return Response({"success": False})
