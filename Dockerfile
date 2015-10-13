FROM daocloud.io/php:5.6-apache

RUN apt-get -y update && apt-get -y install php5-gd libfreetype6-dev && docker-php-ext-install pdo_mysql

COPY . /var/www/html/