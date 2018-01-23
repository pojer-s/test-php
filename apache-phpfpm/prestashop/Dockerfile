FROM php:5.6-fpm

# install the PHP extensions we need
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y \
        libmcrypt-dev \
        libjpeg62-turbo-dev \
        libpcre3-dev \
        libfreetype6-dev \
        libxml2-dev \
        libpng12-dev \
        libicu-dev \
        mysql-client \
        apache2 \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install iconv intl mcrypt pdo pdo_mysql mbstring soap gd zip

ADD .docker/vhost /etc/apache2/sites-enabled/000-default.conf
RUN rm /var/www/html/index.html

RUN a2enmod rewrite expires proxy proxy_fcgi
ADD . /var/www/html

RUN cd /var/www/html ; chown -R www-data: .

ADD .docker/docker-entrypoint.sh /
ADD .docker/apache2-foreground /usr/local/bin/
RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /usr/local/bin/apache2-foreground

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["apache2-foreground"]
