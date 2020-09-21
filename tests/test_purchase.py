from django.test import Client, TestCase

from recipes.models import Recipe
from users.models import User


class TestPurchase(TestCase):
    """Проверка добавления рецепта в список покупок."""

    def setUp(self):
        self.client = Client()
        self.user1 = User.objects.create_user(
            username='user1', email='user1@mail.com', password='12345'
        )
        self.user2 = User.objects.create_user(
            username='user2', email='user2@mail.com', password='23456'
        )
        self.recipe1 = Recipe.objects.create(
            author=self.user1, duration=10, title='название1', text='текст1'
            )
        self.recipe2 = Recipe.objects.create(
            author=self.user2, duration=10, title='название2', text='текст2'
            )

    def test_add_to_purchase(self):
        response = self.client.post("/api/v1/purchases/")
        assert response.status_code == 403, \
            'НЕзалогиненный пользователь не может добавить рецепт в покупки'
        # залогинем пользователя и повторим запрос
        self.client.login(username='user1', password='12345')
        response = self.client.post("/api/v1/purchases/", {"id": 2})
        # статус должен поменяться на 200
        assert response.status_code == 200, \
            'ЗАлогиненный пользователь может добавить ЧУЖОЙ рецепт в покупки'
        assert response.data == {'success': True}, \
            'В ответе должен быть True при успешном добавлении'
        # повторный запрос также должен быть со статусом 200, но в ответе
        # False, так как нельзя второй раз добавить в покупки
        response = self.client.post("/api/v1/purchases/", {"id": 2})
        assert response.status_code == 200, \
            'ЗАлогиненный пользователь может добавить ЧУЖОЙ рецепт в покупки'
        assert response.data == {'success': False}, \
            'Пользователь не может добавить рецепт в покупки второй раз'
        response = self.client.post("/api/v1/purchases/", {"id": 1})
        assert response.data == {'success': True}, \
            'Пользователь МОЖЕТ добавить в покупки свой рецепт'

    def test_remove_to_purchase(self):
        # проверка, что можно удалить рецепт из списка покупок
        self.client.login(username='user1', password='12345')
        self.client.post('/api/v1/purchases/', {'id': 2})
        assert self.user1.purchases.count() == 1, \
            'Проверьте, что вы подписаны'
        self.client.delete('/api/v1/purchases/2/')
        assert self.user1.purchases.count() == 0, \
            'Проверьте, что вы отписались'
