from django.core import mail  # noqa
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView

from .forms import CreationForm


class SignUp(CreateView):
    """
    Регистрация нового пользователя
    и отправка ему письма об успешной регистрации.
    """

    form_class = CreationForm
    success_url = reverse_lazy("login")
    template_name = "reg.html"
