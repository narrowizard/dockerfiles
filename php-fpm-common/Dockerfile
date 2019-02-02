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
    
EXPOSE 9000
