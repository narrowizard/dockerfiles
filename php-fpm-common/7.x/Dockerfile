FROM php:7.3-fpm-alpine
RUN rm -rf /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.9/community/" >> /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.9/main/" >> /etc/apk/repositories && \
    apk add --update \
    pcre-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    zlib-dev \
    libzip-dev \
    libbsd \
    && docker-php-ext-install iconv mysqli pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \ 
    && docker-php-ext-install zip \
    && rm -rf /var/cache/apk/* 

ENV PHPREDIS_VERSION 5.0.2

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9000
