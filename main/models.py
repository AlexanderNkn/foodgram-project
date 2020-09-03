from django.contrib.auth import get_user_model
from django.db import models

from .validators import validate_file_size

User = get_user_model()


class Recipe(models.Model):
    """
    Модель рецептов пользователя
    """

    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="recipe_author",
        verbose_name="автор рецепта",
    )
    title = models.CharField("название рецепта", max_length=256)
    time = models.PositiveSmallIntegerField("время приготовления")
    text = models.TextField("текст рецепта")
    pub_date = models.DateTimeField(
        "дата публикации", auto_now_add=True, db_index=True
    )
    image = models.ImageField(
        upload_to="recipe_images/",
        validators=[validate_file_size],
        verbose_name="изображение",
    )
    slug = models.SlugField("уникальное имя", max_length=256)
    tag = models.ManyToManyField(
        "Tag", related_name="recipe_tag", verbose_name="тег"
    )
    ingredient = models.ManyToManyField(
        "Ingredient",
        related_name="recipe_ingredient",
        through="IngredientAmount",
        verbose_name="ингредиент",
    )

    class Meta:
        ordering = ("-pub_date",)
        verbose_name = "рецепт"
        verbose_name_plural = "рецепты"

    def __str__(self):
        return self.title


class Ingredient(models.Model):
    """Модель ингредиентов в рецепте"""

    title = models.CharField("название ингредиента", max_length=128)
    dimension = models.CharField("единицы измерения", max_length=16)

    class Meta:
        verbose_name = "ингредиент"
        verbose_name_plural = "ингредиенты"

    def __str__(self):
        return self.title


class IngredientAmount(models.Model):
    """Промежуточная модель между моделями ингредиентов и рецептов,
    показывает количество ингредиента в конкретном рецепте
    """

    ingredient = models.ForeignKey(
        Ingredient, on_delete=models.CASCADE, verbose_name="ингредиент")
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, verbose_name="рецепт")
    amount = models.DecimalField(
        "количество", max_digits=6, decimal_places=1
    )

    class Meta:
        verbose_name = "кол-во ингредиента"
        verbose_name_plural = "кол-во ингредиентов"


class Tag(models.Model):
    """Модель тегов"""

    TAG_CHOICES = (
        ("b", "Завтрак"),
        ("d", "Обед"),
        ("s", "Ужин"),
    )
    title = models.CharField("тег", max_length=1, choices=TAG_CHOICES)

    class Meta:
        verbose_name = "тег"
        verbose_name_plural = "теги"

    def __str__(self):
        return self.title
