from .base import * # noqa


# Parse database connection url strings like psql://user:pass@127.0.0.1:8458/db
DATABASES = {
    # read os.environ['DATABASE_URL'] and raises ImproperlyConfigured
    # exception if not found
    'default': env.db('DATABASE_URL'), # noqa
}

STATIC_ROOT = os.path.join(BASE_DIR, "static") # noqa
