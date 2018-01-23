#!/usr/bin/env bash

if [ "$@" == "web" ] ; then

    exec "apache2-foreground"
elif [ "$@" == "fpm" ] ; then
    if [ -f "/var/www/html/prestashop.sql" ] ; then
        sleep 10
        mysql -h db -u prestashop -pprestashop prestashop < /var/www/html/prestashop.sql
    fi
    exec "php-fpm"
else
    exec "$@"
fi
