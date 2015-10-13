FROM daocloud.io/php:5.6-apache

RUN apt-get update \
    && apt-get install -y \
        libz-dev \
	libjpeg-dev \
	libpng-dev \
	php5-gd \
	libbz2-dev \
	libfreetype6-dev \
    && docker-php-ext-install \
	pdo_mysql \
	zip \
    && apt-get clean \
    && apt-get autoclean
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite \
    && mkdir -p /app \
    && rm -fr /var/www/html \
    && ln -s /app/public /var/www/html

WORKDIR /app

COPY . /app

RUN chown -R www-data:www-data /app \
    && chmod -R 0777 /app/storage