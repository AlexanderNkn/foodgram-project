from .base import *  # noqa


DEBUG = True

ALLOWED_HOSTS = ["127.0.0.1", "localhost"]

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
