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
        "ENGINE": os.environ.get("SQL_ENGINE", "django.db.backends.sqlite3"),  # noqa
        "NAME": os.environ.get("SQL_DATABASE", os.path.join(BASE_DIR, "db.sqlite3")),  # noqa
        "USER": os.environ.get("SQL_USER", "user"),  # noqa
        "PASSWORD": os.environ.get("SQL_PASSWORD", "password"),  # noqa
        "HOST": os.environ.get("SQL_HOST", "localhost"),  # noqa
        "PORT": os.environ.get("SQL_PORT", "5432"),  # noqa
    }
}


STATIC_ROOT = os.path.join(BASE_DIR, 'static') # noqa
