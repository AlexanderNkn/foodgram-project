from rest_framework import serializers
from rest_framework.exceptions import ValidationError

from recipes.models import Ingredient, Recipe
from users.models import User

from .models import Favorite, Purchase, Subscribe


class FavoriteSerializer(serializers.ModelSerializer):
    """Сериализатор для рецептов в избранном."""
    # поле называется id для соответствия с Api.js.
    id = serializers.SlugRelatedField(
        slug_field='id', queryset=Recipe.objects.all(), source='recipe')

    class Meta:
        fields = ['id']
        model = Favorite

    def validate_id(self, value):
        """Проверяет, не добавлен ли уже рецепт в избранное, либо не пытается
        ли пользователь добавить в избранное свой рецепт."""
        user = self.context['request'].user
        if user == value.author:
            raise ValidationError(
                'Вы не можете добавить в избранное свой рецепт')
        elif Favorite.objects.filter(user=user, recipe=value).exists():
            raise ValidationError('Вы уже добавили этот рецепт в избранное')
        return value

    def create(self, validated_data):
        if 'user' not in validated_data:
            validated_data['user'] = self.context['request'].user
        return Favorite.objects.create(**validated_data)


class PurchaseSerializer(serializers.ModelSerializer):
    """Сериализатор для рецептов в списке покупок."""
    # поле называется id для соответствия с Api.js.
    id = serializers.SlugRelatedField(
        slug_field='id', queryset=Recipe.objects.all(), source='recipe')

    class Meta:
        fields = ['id']
        model = Purchase

    def validate_id(self, value):
        """Проверяет, не добавлен ли уже рецепт в список покупок."""
        user = self.context['request'].user
        if Purchase.objects.filter(user=user, recipe=value).exists():
            raise ValidationError(
                'Вы уже добавили этот рецепт в список покупок')
        return value

    def create(self, validated_data):
        if 'user' not in validated_data:
            validated_data['user'] = self.context['request'].user
        return Purchase.objects.create(**validated_data)


class SubscribeSerializer(serializers.ModelSerializer):
    """Сериализатор для управления подписками."""
    # поле называется id для соответствия с Api.js.
    id = serializers.SlugRelatedField(
        slug_field='id', queryset=User.objects.all(), source='author')

    class Meta:
        fields = ['id']
        model = Subscribe

    def validate_id(self, value):
        """Проверяет, не подписан ли уже пользователь на этого автора,
        либо не пытается ли пользователь подписаться сам на себя."""
        user = self.context['request'].user
        if Subscribe.objects.filter(user=user, author=value).exists():
            raise ValidationError('Вы уже подписаны на этого автора')
        elif user == value:
            raise ValidationError('Вы не можете подписаться на себя')
        return value

    def create(self, validated_data):
        if 'user' not in validated_data:
            validated_data['user'] = self.context['request'].user
        return Subscribe.objects.create(**validated_data)


class IngredientSerializer(serializers.ModelSerializer):
    """Сериализатор для списка ингредиентов."""

    class Meta:
        fields = '__all__'
        model = Ingredient
