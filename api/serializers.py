from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from rest_framework.validators import UniqueTogetherValidator

from recipes.models import Ingredient, Recipe
from users.models import User

from .models import Favorite, Purchase, Subscribe


class FavoriteSerializer(serializers.ModelSerializer):
    """Сериализатор для рецептов в избранном."""
    # поле называется id для соответствия с Api.js.
    id = serializers.SlugRelatedField(
        slug_field='id', queryset=Recipe.objects.all(), source='recipe')
    user = serializers.PrimaryKeyRelatedField(
        read_only=True, default=serializers.CurrentUserDefault())

    class Meta:
        fields = ['id', 'user']
        model = Favorite
        validators = [
            UniqueTogetherValidator(
                queryset=Favorite.objects.all(),
                fields=['id', 'user']
            )
        ]

    def validate_id(self, value):
        """Проверяет, не пытается ли пользователь добавить в избранное свой
        рецепт."""
        user = self.context['request'].user
        if user == value.author:
            raise ValidationError(
                'Вы не можете добавить в избранное свой рецепт')
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
    user = serializers.PrimaryKeyRelatedField(
        read_only=True, default=serializers.CurrentUserDefault())

    class Meta:
        fields = ['id', 'user']
        model = Purchase
        validators = [
            UniqueTogetherValidator(
                queryset=Purchase.objects.all(),
                fields=['id', 'user']
            )
        ]

    def create(self, validated_data):
        if 'user' not in validated_data:
            validated_data['user'] = self.context['request'].user
        return Purchase.objects.create(**validated_data)


class SubscribeSerializer(serializers.ModelSerializer):
    """Сериализатор для управления подписками."""
    # поле называется id для соответствия с Api.js.
    id = serializers.SlugRelatedField(
        slug_field='id', queryset=User.objects.all(), source='author')
    user = serializers.PrimaryKeyRelatedField(
        read_only=True, default=serializers.CurrentUserDefault())

    class Meta:
        fields = ['id', 'user']
        model = Subscribe
        validators = [
            UniqueTogetherValidator(
                queryset=Subscribe.objects.all(),
                fields=['id', 'user']
            )
        ]

    def validate_id(self, value):
        """Проверяет, не пытается ли пользователь подписаться сам на себя."""
        user = self.context['request'].user
        if user == value:
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
