from django.contrib import admin
from .models import Recipe, Ingredient, IngredientAmount, Tag


class IngredientAmountInline(admin.TabularInline):
    model = IngredientAmount
    min_num = 1
    extra = 0


class TagInline(admin.TabularInline):
    model = Tag
    min_num = 1
    extra = 0


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    inlines = (IngredientAmountInline, TagInline)
    list_display = ("id", "author", "title", "duration", "image", "get_tag")
    list_filter = ("author", "title", "recipe_tag__title")
    search_fields = ("title", "author__username", )
    autocomplete_fields = ("author", )

    def get_tag(self, obj):
        return list(obj.recipe_tag.values_list("title", flat=True))

    get_tag.short_description = "Теги"


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
