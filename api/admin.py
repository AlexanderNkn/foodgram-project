from django.contrib import admin

from .models import Favorite, Purchase, Subscribe


@admin.register(Favorite)
class FavoriteAdmin(admin.ModelAdmin):
    list_display = ("user", "recipe", )


@admin.register(Subscribe)
class SubscribeAdmin(admin.ModelAdmin):
    list_display = ("user", "author", )


@admin.register(Purchase)
class PurchaseAdmin(admin.ModelAdmin):
    list_display = ("user", "recipe", )
