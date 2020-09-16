from api.models import Favorite, Purchase, Subscribe


def purchase_counter(request):
    '''Контекстный процессор возвращает количество покупок
    в списке покупок.'''
    if request.user.is_authenticated:
        purchase_counter = Purchase.objects.filter(user=request.user).count()
        return {'purchase_counter': purchase_counter}
    return {'purchase_counter': 0}


def favorite(request):
    '''Добавляет в контекст id рецептов из избранных.'''
    if request.user.is_authenticated:
        favorite = list(Favorite.objects.filter(user=request.user)
                        .values_list('recipe_id', flat=True))
        return {'favorite': favorite}
    return {'favorite': []}


def purchase(request):
    '''Добавляет в контекст id рецептов из списка покупок.'''
    if request.user.is_authenticated:
        purchase = list(Purchase.objects.filter(user=request.user)
                        .values_list('recipe_id', flat=True))
        return {'purchase': purchase}
    return {'purchase': []}


def subscribe(request):
    '''Добавляет в контекст id авторов, на которых пользователь подписан.'''
    if request.user.is_authenticated:
        subscribe = list(Subscribe.objects.filter(user=request.user)
                         .values_list('author_id', flat=True))
        return {'subscribe': subscribe}
    return {'subscribe': []}
