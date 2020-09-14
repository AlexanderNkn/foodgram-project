from django import forms

from .models import Recipe


class RecipeForm(forms.ModelForm):
    '''Класс формы для создания рецепта'''

    TAG_CHOICES = (
        ('Завтрак', 'Завтрак'),
        ('Обед', 'Обед'),
        ('Ужин', 'Ужин'),
    )

    title = forms.CharField(max_length=256)
    tag = forms.MultipleChoiceField(
        widget=forms.CheckboxSelectMultiple,
        choices=TAG_CHOICES,
    )
    duration = forms.IntegerField(min_value=1)
    text = forms.CharField(widget=forms.Textarea(attrs={'class':'form__textarea'}))
    image = forms.ImageField(required=False)

    class Meta:
        model = Recipe
        fields = ('title', 'duration', 'text', 'image', )
