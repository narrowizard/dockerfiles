FROM php:5.6.32-fpm-alpine
RUN rm -rf /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/community/" >> /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/main/" >> /etc/apk/repositories && \
    apk add --update \
        pcre-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib-dev \
    && docker-php-ext-install iconv mcrypt mysql pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \ 
    && docker-php-ext-install zip \
    && rm -rf /var/cache/apk/* 

ENV PHPREDIS_VERSION 2.2.7

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis
    
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9000
