# Builds a goaccess image from the current working directory:
FROM alpine:edge

COPY . /goaccess
WORKDIR /goaccess

ARG build_deps="build-base ncurses-dev autoconf automake git gettext-dev geoip-dev"
ARG runtime_deps="tini ncurses libintl gettext openssl-dev geoip libmaxminddb-dev libmaxminddb"

RUN rm -rf /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/community/" >> /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/main/" >> /etc/apk/repositories

RUN apk update && \
    apk add -u $runtime_deps $build_deps && \
    autoreconf -fiv && \
    ./configure --enable-utf8 --with-openssl --enable-geoip=mmdb && \
    make && \
    make install && \
    apk del $build_deps && \
    rm -rf /var/cache/apk/* /tmp/goaccess/* /goaccess

# Install language pack
RUN apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk && \
    apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk

# Iterate through all locale and install it
# Note that locale -a is not available in alpine linux, use `/usr/glibc-compat/bin/locale -a` instead
# Feel free to remove lines of languages you don't want to install in ./locale.md.
COPY ./locale.md /locale.md
RUN cat /locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8

# Set the lang, you can also specify it as as environment variable through docker-compose.yml
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8

VOLUME /srv/data
VOLUME /srv/logs
VOLUME /srv/report
EXPOSE 7890

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["goaccess", "--no-global-config", "--config-file=/srv/data/goaccess.conf"]
