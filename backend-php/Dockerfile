FROM php:7.4-fpm-alpine

# mysqli, pdo, pdo_mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql

# git client, mysql-client
RUN apk add --update --no-cache git mysql-client

RUN set -ex \
    && apk --no-cache add \
    postgresql-dev

RUN docker-php-ext-install pdo pdo_pgsql pgsql

#################################################################################################
# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
#################################################################################################

RUN sed -i -e 's/listen.*/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.conf

COPY php.ini /usr/local/etc/php/php.ini
# RUN echo "expose_php=0" > /usr/local/etc/php/php.ini

WORKDIR /opt/work

CMD ["php-fpm"]%    