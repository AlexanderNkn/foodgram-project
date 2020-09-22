from decimal import Decimal

from .models import Ingredient, IngredientAmount, Recipe, Tag


def filter_tag(request):
    """Функция готовит общую выборку рецептов в зависимости от тега
    для дальнейшего фильтрования при необходимости."""
    tags = request.GET.get('tags', 'bds')
    recipe_list = Recipe.objects.prefetch_related(
        'author', 'recipe_tag'
        ).filter(
        recipe_tag__slug__in=tags
        ).distinct()
    return recipe_list, tags


def get_tag(tags):
    """Функция переводит русские названия в английские. Нужна для
    корректного отображения тегов при создании и редактировании рецепта."""
    tag_dict = {
        'Завтрак': 'breakfast',
        'Обед': 'lunch',
        'Ужин': 'dinner',
    }
    return [tag_dict[item] for item in tags]


def save_recipe(request, form):
    """Функция сохраняет данные в db при создании и редактировании рецепта."""
    recipe = form.save(commit=False)
    recipe.author = request.user
    # сохраняем рецепт без тегов и количества ингредиентов
    recipe.save()

    # добавляем теги
    # если делать bulk_create, то не подтянутся цвета
    tags = form.cleaned_data['tag']
    for tag in tags:
        Tag.objects.create(recipe=recipe, title=tag)
    # через bulk_create не подтягиваются цвета тегов
    # objs = [Tag(recipe=recipe, title=tag) for tag in tags]
    # Tag.objects.bulk_create(objs)

    # добавляем количество ингредиентов
    objs = []  # объекты для bulk_create
    for key, value in form.data.items():
        if 'nameIngredient' in key:
            title = value
        elif 'valueIngredient' in key:
            amount = Decimal(value.replace(',', '.'))
        elif 'unitsIngredient' in key:
            dimension = value
            # получаем экземпляр ингредиента
            # и собираем объекты IngredientAmount
            ing = Ingredient.objects.get(title=title, dimension=dimension)
            objs.append(
                IngredientAmount(ingredient=ing, recipe=recipe, amount=amount)
            )
    IngredientAmount.objects.bulk_create(objs)
    return None
