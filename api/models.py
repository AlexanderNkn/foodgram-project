from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from django.db import models

from main.models import Recipe

User = get_user_model()


class Favorite(models.Model):
    """
    Класс добавляет понравивишиеся рецепты в избранное.
    """
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="favorits",
        verbose_name="пользователь",
    )
    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        related_name="recipe_favorite",
        verbose_name="рецепт в избранном",
    )

    class Meta:
        unique_together = [["user", "recipe"]]
        verbose_name = "избранный рецепт"
        verbose_name_plural = "избранные рецепты"

    def clean(self):
        if self.user.username == self.recipe.author.username:
            raise ValidationError(
                "Пользователь не может добавлять в избранное свои рецепты"
            )

    def __str__(self):
        return f"{self.user.username} добавил в избранное {self.recipe.title}"


class Subscribe(models.Model):
    """
    Класс создает подписку на понравившегося автора.
    """

    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="following",
        verbose_name="подписался на"
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="follower",
        verbose_name="подписчик"
    )

    class Meta:
        unique_together = [["user", "author"]]
        verbose_name = "подписку"
        verbose_name_plural = "подписки"

    def clean(self):
        if self.author == self.user:
            raise ValidationError(
                "Пользователь не может подписываться сам на себя"
            )

    def __str__(self):
        return f"{self.user.username} подписался на {self.author.username}"


class Purchase(models.Model):
    """
    Класс собирает выбранные рецепты для последующего
    формирования списка ингериентов для покупки.
    """

    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="purchases",
        verbose_name="пользователь",
    )
    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        related_name="recipe_purchase",
        verbose_name="рецепт в покупках",
    )

    class Meta:
        unique_together = [["user", "recipe"]]
        verbose_name = "рецепт в список покупок"
        verbose_name_plural = "рецепты в списке покупок"

    def __str__(self):
        return f"{self.user.username} добавил в покупки {self.recipe.title}"
