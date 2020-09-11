import itertools

from django.contrib.auth import get_user_model
from django.db import models
from django.utils.safestring import mark_safe
from django.utils.text import slugify

from .validators import validate_file_size

User = get_user_model()


class Recipe(models.Model):
    """
    Модель рецептов пользователя.
    """

    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="recipe_author",
        verbose_name="автор рецепта",
    )
    title = models.CharField("название рецепта", max_length=256)
    duration = models.PositiveSmallIntegerField("время приготовления")
    text = models.TextField("текст рецепта")
    pub_date = models.DateTimeField(
        "дата публикации", auto_now_add=True, db_index=True
    )
    image = models.ImageField(
        upload_to="recipe_images/",
        validators=[validate_file_size],
        verbose_name="изображение",
    )
    slug = models.SlugField(
        "уникальное имя", default="", editable=False, max_length=32
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

    def _generate_slug(self):
        # функция создает уникальный slug из названия рецепта(на кириллице)
        max_length = self._meta.get_field("slug").max_length
        value = self.title
        slug_candidate = slug_original = slugify(value, allow_unicode=True)[
            :max_length
        ]  # noqa
        for i in itertools.count(1):
            if not Recipe.objects.filter(slug=slug_candidate).exists():
                break
            slug_candidate = "{}-{}".format(slug_original, i)

        self.slug = slug_candidate

    def save(self, *args, **kwargs):
        if not self.pk:
            self._generate_slug()

        super().save(*args, **kwargs)

    def image_img(self):
        if self.image:
            return mark_safe(
                f'<img width="90" height="50" src="{self.image.url}" />'
            )
        else:
            return f"Без изображения"  # noqa

    def __str__(self):
        return self.title

    image_img.short_description = 'изображение'


class Ingredient(models.Model):
    """Модель ингредиентов в рецепте."""

    title = models.CharField(
        "название ингредиента", max_length=128, db_index=True
    )
    dimension = models.CharField("единицы измерения", max_length=16)

    class Meta:
        unique_together = [["title", "dimension"]]
        verbose_name = "ингредиент"
        verbose_name_plural = "ингредиенты"
        ordering = ("title",)

    def __str__(self):
        return f"{self.title}, {self.dimension}"


class IngredientAmount(models.Model):
    """Промежуточная модель между моделями ингредиентов и рецептов,
    показывает количество ингредиента в конкретном рецепте.
    """

    ingredient = models.ForeignKey(
        Ingredient, on_delete=models.CASCADE, verbose_name="ингредиент"
    )
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, verbose_name="рецепт"
    )
    amount = models.DecimalField("количество", max_digits=6, decimal_places=1)

    class Meta:
        verbose_name = "кол-во ингредиента"
        verbose_name_plural = "кол-во ингредиентов"

    def __str__(self):
        return f"Из рецепта '{self.recipe}'"


class Tag(models.Model):
    """Модель тегов"""

    TAG_CHOICES = (
        ("Завтрак", "Завтрак"),
        ("Обед", "Обед"),
        ("Ужин", "Ужин"),
    )
    title = models.CharField("тег", max_length=10, choices=TAG_CHOICES)
    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        verbose_name="рецепт",
        related_name="recipe_tag",
    )
    slug = models.SlugField(
        "уникальное имя тега", default="", editable=False, max_length=3
    )
    color = models.CharField(
        "цвет тега", max_length=10, default="", editable=False,
        )

    class Meta:
        verbose_name = "тег"
        verbose_name_plural = "теги"

    def _generate_slug_and_colour(self):
        value = self.title
        if value == 'Ужин':
            self.slug = 's'
            self.color = 'purple'
        elif value == 'Обед':
            self.slug = 'd'
            self.color = 'green'
        else:
            self.slug = 'b'
            self.color = 'orange'

    def save(self, *args, **kwargs):
        self._generate_slug()
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title
