from django.test import Client, TestCase

from users.models import User


class TestSubscribe(TestCase):
    """Проверка правильности работы системы подписок."""

    def setUp(self):
        self.client = Client()
        self.user1 = User.objects.create_user(
            username='user1', email='user1@mail.com', password='12345'
        )
        self.user2 = User.objects.create_user(
            username='user2', email='user2@mail.com', password='23456'
        )

    def test_follow_author(self):
        response = self.client.post('/api/v1/subscriptions/', {'id': 2})
        assert response.status_code == 403, \
            'НЕзалогиненный пользователь не может подписаться на авторов'
        # залогинем пользователя и повторим запрос
        self.client.login(username='user1', password='12345')
        response = self.client.post('/api/v1/subscriptions/', {'id': 2})
        # статус должен поменяться на 200
        assert response.status_code == 200, \
            'ЗАлогиненный пользователь может подписаться на авторов'
        assert response.data == {'success': True}, \
            'В ответе должен быть True при успешной подписке'
        # повторный запрос также должен быть со статусом 200, но в ответе
        # False, так как нельзя второй раз подписаться
        response = self.client.post('/api/v1/subscriptions/', {'id': 2})
        assert response.status_code == 200, \
            'ЗАлогиненный пользователь может подписаться на авторов'
        assert response.data == {'success': False}, \
            'Пользователь не может подписаться второй раз на себя'
        response = self.client.post('/api/v1/subscriptions/', {'id': 1})
        assert response.data == {'success': False}, \
            'Пользователь не может подписаться на себя'

    def test_unfollow_author(self):
        # проверка, что можно отписаться
        self.client.login(username='user1', password='12345')
        self.client.post('/api/v1/subscriptions/', {'id': 2})
        assert self.user1.follower.count() == 1, \
            'Проверьте, что вы подписаны'
        self.client.delete('/api/v1/subscriptions/2/')
        assert self.user1.follower.count() == 0, \
            'Проверьте, что вы отписались'
