from rest_framework import serializers
from rest_framework.exceptions import ValidationError

from recipes.models import Ingredient, Recipe
from users.models import User

from .models import Favorite, Purchase, Subscribe


class SlugRelatedRequestUserField(serializers.SlugRelatedField):
    '''Это поле делает выборку отношений только по текущему пользователю.'''

    def get_queryset(self):
        queryset = self.queryset
        request = self.context.get('request', None)
        if request:
            queryset = queryset.filter(username=request.user.username)
        return queryset


class FavoriteSerializer(serializers.ModelSerializer):
    '''Сериализатор для рецептов в избранном.'''

    user = SlugRelatedRequestUserField(
        slug_field='username', queryset=User.objects.all()
    )
    recipe = serializers.SlugRelatedField(
        slug_field='title', queryset=Recipe.objects.all()
    )

    class Meta:
        fields = '__all__'
        model = Favorite

    def validate_recipe(self, value):
        """Проверяет, что пользователь не добавляет в избранное
        свой рецепт.
        """
        user = self.context['request'].user
        if user == value.author:
            raise ValidationError(
                'Вы не можете добавить в избранное свой рецепт'
            )
        return value


class PurchaseSerializer(serializers.ModelSerializer):
    '''Сериализатор для рецептов в списке покупок.'''

    user = SlugRelatedRequestUserField(
        slug_field='username', queryset=User.objects.all()
    )
    recipe = serializers.SlugRelatedField(
        slug_field='title', queryset=Recipe.objects.all()
    )

    class Meta:
        fields = '__all__'
        model = Purchase


class SubscribeSerializer(serializers.ModelSerializer):
    '''Сериализатор для управления подписками'''

    user = SlugRelatedRequestUserField(
        slug_field='username', queryset=User.objects.all()
    )
    author = serializers.SlugRelatedField(
        slug_field='username', queryset=User.objects.all()
    )

    class Meta:
        fields = '__all__'
        model = Subscribe

    def validate_author(self, value):
        """
        Проверяет, не подписан ли уже пользователь на этого автора,
        либо не пытается ли пользователь подписаться сам на себя.
        """
        user = self.context['request'].user
        if Subscribe.objects.filter(user=user, author=value).exists():
            raise ValidationError('Вы уже подписаны на этого автора')
        elif user == value:
            raise ValidationError('Вы не можете подписаться на себя')
        return value


class IngredientSerializer(serializers.ModelSerializer):
    '''Сериализатор для списка ингредиентов'''

    class Meta:
        fields = '__all__'
        model = Ingredient
