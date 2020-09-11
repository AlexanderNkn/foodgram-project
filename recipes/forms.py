from django import forms

from .models import Ingredient


class RecipeForm(forms.Form):
    '''Класс формы для создания рецепта'''

    TAG_CHOICES = (
        ("breakfast", "Завтрак"),
        ("lunch", "Обед"),
        ("dinner", "Ужин"),
    )

    title = forms.CharField(max_length=256, required=True)
    tag = forms.MultipleChoiceField(
        widget=forms.CheckboxSelectMultiple,
        choices=TAG_CHOICES,
    )
    duration = forms.IntegerField(min_value=1)
    text = forms.CharField(widget=forms.Textarea)
    image = forms.ImageField()
    ingredient = forms.ModelMultipleChoiceField(
        widget=forms.CheckboxSelectMultiple,
        queryset=Ingredient.objects.all(),
    )
