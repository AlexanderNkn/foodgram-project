from django.contrib import admin

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
        "id", "author", "title", "duration",
        "image", "get_tag", "get_favorite",
    )
    list_filter = ("author", "title", "recipe_tag__title", )
    search_fields = ("title", "author__username", )
    autocomplete_fields = ("author", )

    def get_tag(self, obj):
        return list(obj.recipe_tag.values_list("title", flat=True))

    def get_favorite(self, obj):
        return obj.recipe_favorite.count()

    get_tag.short_description = "теги"
    get_favorite.short_description = "добавлен в избранное, раз"
    get_favorite.admin_order_field = "recipe_favorites"


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
