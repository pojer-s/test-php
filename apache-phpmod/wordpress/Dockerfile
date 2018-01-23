FROM php:5.6-apache

# install the PHP extensions we need
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y \
        libjpeg-dev \
        libpng12-dev \
        mysql-client \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install gd mysqli opcache

RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=2'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/php.ini

RUN a2enmod rewrite expires
ADD . /var/www/html

RUN cd /var/www/html ; chown -R www-data: .

ADD .docker/docker-entrypoint.sh /
ADD .docker/apache2-foreground /usr/local/bin/
RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /usr/local/bin/apache2-foreground

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["apache2-foreground"]
