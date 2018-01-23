#!/usr/bin/env bash

if [ -f "/var/www/html/prestashop.sql" ] ; then
    sleep 10
    mysql -h db -u prestashop -pprestashop prestashop < /var/www/html/prestashop.sql
fi

exec "$@"
