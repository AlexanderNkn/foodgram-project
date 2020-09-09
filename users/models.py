from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _


class User(AbstractUser):
    """
    A custom user model to add features when needed.
    """
    # email required
    email = models.EmailField(_("email address"), unique=True)
