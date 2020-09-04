from django.contrib import admin
from django.db.models import Count

from .models import Ingredient, IngredientAmount, Recipe, Tag


class IngredientAmountInline(admin.TabularInline):
    model = IngredientAmount
    min_num = 1
    extra = 0
    verbose_name = "ингредиент"


class TagInline(admin.TabularInline):
    model = Tag
    min_num = 1
    extra = 0


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    inlines = (IngredientAmountInline, TagInline)
    list_display = (
        "id", "author", "title", "image_img", "duration",
        "get_favorite", "get_tag",
    )
    list_filter = ("author", "title", "recipe_tag__title", )
    search_fields = ("title", "author__username", )
    autocomplete_fields = ("author", )

    def get_queryset(self, request):
        queryset = super().get_queryset(request)
        return queryset.annotate(_get_favorite=Count("recipe_favorite"))

    def get_tag(self, obj):
        return list(obj.recipe_tag.values_list("title", flat=True))

    def get_favorite(self, obj):
        return obj._get_favorite

    get_tag.short_description = "теги"
    get_tag.admin_order_field = "recipe_tag"
    get_favorite.short_description = "добавлен в избранное, раз"
    get_favorite.admin_order_field = "_get_favorite"


@admin.register(Ingredient)
class IngredientAdmin(admin.ModelAdmin):
    list_display = ("title", "dimension", )
    search_fields = ("^title", )


@admin.register(IngredientAmount)
class IngredientAmountAdmin(admin.ModelAdmin):
    list_display = ("ingredient", "recipe", "amount", )


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ("title", "recipe", )
