from .base import * # noqa


DEBUG = True
ALLOWED_HOSTS = [
    "localhost",
    "127.0.0.1",
    "130.193.37.251",
]
STATICFILES_DIR = os.path.join(BASE_DIR, 'static') # noqa

# settings for debug-toolbar
INTERNAL_IPS = [
    "127.0.0.1",
]

# Logging
if DEBUG:
    LOGGING = {
        "version": 1,
        "disable_existing_loggers": False,
        "handlers": {
            "console": {"level": "DEBUG", "class": "logging.StreamHandler"}
        },
        "loggers": {
            "django.db.backends": {"handlers": ["console"], "level": "DEBUG"}
        },
    }
