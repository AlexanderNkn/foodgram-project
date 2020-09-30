from .base import *  # noqa

ALLOWED_HOSTS = [
    'localhost',
    '127.0.0.1',
    '130.193.37.251',
    'my-foodgram.ml',
    'www.my-foodgram.ml',
]
# ALLOWED_HOSTS = env('DJANGO_ALLOWED_HOSTS').split(' ')  # noqa

DATABASES = {
    "default": {
        'ENGINE': os.environ.get('DB_ENGINE', 'django.db.backends.postgresql'),  # noqa
        'NAME': os.environ.get('DB_NAME'),  # noqa
        'USER': os.environ.get('DB_USER'),  # noqa
        'PASSWORD': os.environ.get('DB_PASSWORD'),  # noqa
        'HOST': os.environ.get('DB_HOST'),  # noqa
        'PORT': os.environ.get('DB_PORT'),  # noqa
    }
}


STATIC_ROOT = os.path.join(BASE_DIR, 'static') # noqa
