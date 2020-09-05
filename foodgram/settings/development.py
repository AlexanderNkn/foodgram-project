from .base import * # noqa


DEBUG = True
ALLOWED_HOSTS = ["127.0.0.1", "localhost"]
STATICFILES_DIR = os.path.join(BASE_DIR, 'static') # noqa

# settings for debug-toolbar
INSTALLED_APPS += [ # noqa
    "debug_toolbar",
]
MIDDLEWARE += [ # noqa
    "debug_toolbar.middleware.DebugToolbarMiddleware",
]
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
