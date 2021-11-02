#!/bin/bash
sleep 5
wp plugin install redis-cache --activate --allow-root
mv /object-cache.php /var/www/html/wp-content/object-cache.php

set -- /usr/sbin/php-fpm7.3 "$@"
exec "$@"