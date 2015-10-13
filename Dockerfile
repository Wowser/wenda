FROM daocloud.io/php:5.6-apache

RUN  apt-get -y update && apt-get -y install php5-gd libfreetype6-dev && docker-php-ext-install pdo_mysql

RUN a2enmod rewrite \
    && mkdir -p /app \
    && rm -fr /var/www/html \
    && ln -s /app/public /var/www/html

WORKDIR /app

COPY . /app

RUN chown -R www-data:www-data /app \
    && chmod -R 0777 /app/storage