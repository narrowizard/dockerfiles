# Builds a goaccess image from the current working directory:
FROM alpine:edge

COPY . /goaccess
WORKDIR /goaccess

ARG build_deps="build-base ncurses-dev autoconf automake git gettext-dev geoip-dev"
ARG runtime_deps="tini ncurses libintl gettext openssl-dev geoip"

RUN rm -rf /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/community/" >> /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/main/" >> /etc/apk/repositories

RUN apk update && \
    apk add -u $runtime_deps $build_deps && \
    autoreconf -fiv && \
    ./configure --enable-utf8 --with-openssl --enable-geoip=legacy --enable-debug && \
    make && \
    make install && \
    apk del $build_deps && \
    rm -rf /var/cache/apk/* /tmp/goaccess/* /goaccess

VOLUME /srv/data
VOLUME /srv/logs
VOLUME /srv/report
EXPOSE 7890

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["goaccess", "--no-global-config", "--config-file=/srv/data/goaccess.conf"]