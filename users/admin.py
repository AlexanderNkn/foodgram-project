from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .models import User


class Admin(UserAdmin):
    """
    Expand functionality in admin site.
    """
    list_filter = ("username", "email", )
    search_fields = ("^username", "^email", )


admin.site.register(User, Admin)
