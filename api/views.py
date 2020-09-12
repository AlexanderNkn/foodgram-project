from django.http import Http404
from rest_framework import filters, generics, mixins, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from recipes.models import Ingredient

from .models import Favorite, Purchase, Subscribe
from .serializers import (FavoriteSerializer, IngredientSerializer,
                          PurchaseSerializer, SubscribeSerializer)


class IngredientAPIView(generics.ListAPIView):
    '''Предоставляет поиск в базе ингредиентов по их названиям.
    '''
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['^title', ]


class CreateDestroyViewSet(mixins.CreateModelMixin,
                           mixins.DestroyModelMixin,
                           viewsets.GenericViewSet):
    permission_classes = [IsAuthenticated]
    '''
    Вьюсет предоставляет методы POST и DELETE для расширения других классов.
    '''

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            return Response({"success": "true"})
        return Response({"success": "false"})

    def destroy(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            self.perform_destroy(instance)
            return Response({"success": "true"})
        except Http404:
            return Response({"success": "false"})


class FavoriteViewSet(CreateDestroyViewSet):
    '''Вьюсет добавляет и удаляет рецепты в избранное.
       Пользователь может добавлять/удалять только чужие рецепты.
    '''
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer


class PurchaseViewSet(CreateDestroyViewSet):
    '''Вьюсет добавляет и удаляет рецепты в список покупок.
       Пользователь может добавлять/удалять любые рецепты.
    '''
    queryset = Purchase.objects.all()
    serializer_class = PurchaseSerializer


class SubscribeViewSet(CreateDestroyViewSet):
    '''Вьюсет добавляет и удаляет подписки на авторов.'''
    queryset = Subscribe.objects.all()
    serializer_class = SubscribeSerializer
