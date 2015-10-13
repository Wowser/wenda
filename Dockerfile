FROM daocloud.io/php:5.6-apache

RUN  apt-get -y update && apt-get -y install mysql-client php5 ImageMagick  apache2 php5-gd php5-mysql

RUN a2enmod rewrite \
    && mkdir -p /app \
    && rm -fr /var/www/html \
    && ln -s /app/public /var/www/html

WORKDIR /app

COPY . /app

RUN chown -R www-data:www-data /app \
    && chmod -R 0777 /app/storage