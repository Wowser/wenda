FROM daocloud.io/php:5.6-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql 

RUN a2enmod rewrite \ 
    && mkdir -p /app \ 
    && rm -fr /var/www/html \ 
    && ln -s /app/public /var/www/html 

WORKDIR /app

COPY . /app

RUN chown -R www-data:www-data /app \  
&& chmod -R 0777 /app/storage \
&& chmod -R 0775 /app/system \
&& chmod -R 0775 /app/system/config/