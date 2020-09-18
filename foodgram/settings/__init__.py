from .base import *  # noqa


if os.environ['foodgram'] == 'prod':  # noqa
   from .production import *  # noqa
else:
   from .development import *  # noqa
