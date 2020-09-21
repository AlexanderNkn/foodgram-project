from django.test import Client, TestCase

from recipes.models import Recipe
from users.models import User


class TestFavorite(TestCase):
    """Проверка добавления рецепта в избранное."""

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

    def test_follow_favorite(self):
        response = self.client.post("/api/v1/favorites/", {"id": 1})
        assert response.status_code == 403, \
            'НЕзалогиненный пользователь не может добавить рецепт в избранное'
        # залогинем пользователя и повторим запрос
        self.client.login(username='user1', password='12345')
        response = self.client.post("/api/v1/favorites/", {"id": 2})
        # статус должен поменяться на 200
        assert response.status_code == 200, \
            'ЗАлогиненный пользователь может добавить ЧУЖОЙ рецепт в избранное'
        assert response.data == {'success': True}, \
            'В ответе должен быть True при успешном добавлении'
        # повторный запрос также должен быть со статусом 200, но в ответе
        # False, так как нельзя второй раз добавить в избранное
        response = self.client.post("/api/v1/favorites/", {"id": 2})
        assert response.status_code == 200, \
            'ЗАлогиненный пользователь может добавить ЧУЖОЙ рецепт в избранное'
        assert response.data == {'success': False}, \
            'Пользователь не может добавить рецепт в избранное второй раз'
        response = self.client.post("/api/v1/favorites/", {"id": 1})
        assert response.data == {'success': False}, \
            'Пользователь не может добавить в избранное свой рецепт'

    def test_unfollow_favorite(self):
        # проверка, что можно удалить рецепт из избранного
        self.client.login(username='user1', password='12345')
        self.client.post('/api/v1/favorites/', {'id': 2})
        assert self.user1.favorites.count() == 1, \
            'Проверьте, что вы подписаны'
        self.client.delete('/api/v1/favorites/2/')
        assert self.user1.favorites.count() == 0, \
            'Проверьте, что вы отписались'
