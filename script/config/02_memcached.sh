#!/bin/bash

source /usr/local/bin/common.sh

log_info "Configuring memcached"

echo "CACHES = {
    'default': {
        'BACKEND': 'django_pylibmc.memcached.PyLibMCCache',
        'LOCATION': 'memcached:11211',
    },
    'locmem': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
    },
}
COMPRESS_CACHE_BACKEND = 'locmem'" >> $EXPOSED_ROOT_DIR/conf/seahub_settings.py
