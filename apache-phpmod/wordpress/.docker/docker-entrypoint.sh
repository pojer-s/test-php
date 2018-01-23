#!/usr/bin/env bash

if ! [ -z "$WORDPRESS_DB_HOST" ] ; then
    sed -i "s/define('DB_HOST', 'db:3306');/define('DB_HOST', '$WORDPRESS_DB_HOST');/g" /var/www/html/wp-config.php
else
    WORDPRESS_DB_HOST=db
fi

if ! [ -z "$WORDPRESS_DB_USER" ] ; then
    sed -i "s/define('DB_USER', 'wordpress');/define('DB_USER', '$WORDPRESS_DB_USER');/g" /var/www/html/wp-config.php
else
    WORDPRESS_DB_USER=wordpress
fi

if ! [ -z "$WORDPRESS_DB_PASSWORD" ] ; then
    sed -i "s/define('DB_PASSWORD', 'wordpress');/define('DB_PASSWORD', '$WORDPRESS_DB_PASSWORD');/g" /var/www/html/wp-config.php
else
    WORDPRESS_DB_PASSWORD=wordpress
fi

if ! [ -z "$WORDPRESS_DB_NAME" ] ; then
    sed -i "s/define('DB_NAME', 'wordpress');/define('DB_NAME', '$WORDPRESS_DB_NAME');/g" /var/www/html/wp-config.php
else
    WORDPRESS_DB_NAME=wordpress
fi

if [ -f "/var/www/html/wordpress.sql" ] ; then
    sleep 10
    mysql -h $WORDPRESS_DB_HOST -u $WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME < /var/www/html/wordpress.sql
fi

exec "$@"
