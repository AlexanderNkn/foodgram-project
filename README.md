# foodgram-project
[![Foodgram%20workflow Actions Status](https://github.com/AlexanderNkn/foodgram-project/workflows/Foodgram%20workflow/badge.svg)](https://github.com/AlexanderNkn/foodgram-project/actions)

Проект — сайт «Продуктовый помощник»

### Описание
«Продуктовый помощник» -это онлайн-сервис, где пользователи смогут публиковать рецепты, подписываться на публикации других пользователей, добавлять понравившиеся рецепты в список «Избранное», а перед походом в магазин скачивать сводный список продуктов, необходимых для приготовления одного или нескольких выбранных блюд. Сайт расположен по адресу http://my-foodgram.ml

### Установка
- склонируйте проект с реппозитория GitHub
    ```
    git clone https://github.com/AlexanderNkn/foodgram-project.git
    ```
- перейдите в директорию foodgram-project/
    ```
    cd foodgram-project/
    ```
- запустите docker-compose
    ```
    docker-compose -f docker-compose.prod.yaml up -d
    ```

### Дополнительные возможности
- заполнить базу тестовыми данными
    ```
    docker-compose -f docker-compose.prod.yaml run --rm web python manage.py loaddata fixtures.json
    ```
- создать суперпользователя
    ```
    docker-compose -f docker-compose.prod.yaml run --rm web python manage.py createsuperuser
    ```
