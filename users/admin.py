from django.contrib import admin, auth

from .models import User


class Admin(auth.admin.UserAdmin):
    """
    Expand functionality in admin site.
    """
    list_filter = ("username", "email", )
    search_fields = ("^username", "^email", )


admin.site.register(User, Admin)
admin.site.unregister(auth.models.Group)
