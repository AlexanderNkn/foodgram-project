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
    success_url = reverse_lazy("recipes")
    template_name = "reg.html"

#    def form_valid(self, form):
#        # валидация формы регистрации позволяет не вводить повторно
#        # корректные данные, если одновременно были указаны некорректные.
#        email = form.cleaned_data["email"]
#        first_name = form.cleaned_data["first_name"]
#        last_name = form.cleaned_data["last_name"]
#        self.send_email(email, first_name, last_name)
#        return super().form_valid(form)

#    def send_email(self, email, first_name=None, last_name=None):
#        # отправка письма об успешной регистрации
#        if not first_name and not last_name:
#            text = "Благодарим"
#        else:
#            text = ", благодарим"
#        mail.send_mail(
#            "Регистрация пользователя",
#            f"{last_name} {first_name}{text} за регистрацию на нашем сайте!",
#            "yatube@mail.ru",
#            [email],
#            fail_silently=False,
#        )
