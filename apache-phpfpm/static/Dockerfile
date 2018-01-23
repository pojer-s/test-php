FROM php:5.6-apache

ADD . /var/www/html

RUN cd /var/www/html ; chown -R www-data: .

ADD .docker/docker-entrypoint.sh /
ADD .docker/apache2-foreground /usr/local/bin/
RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /usr/local/bin/apache2-foreground

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["apache2-foreground"]
