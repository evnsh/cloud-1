FROM alpine:3.21

RUN apk update && \
    apk add --no-cache \
    php83 \
    php83-session \
    php83-mysqli \
    php83-zlib \
    php83-json \
    php83-openssl \
    php83-iconv \
    php83-curl \
    php83-ctype \
    php83-mbstring \
    php83-fpm \
    nginx \
    curl \
    bash

RUN curl -o /tmp/phpmyadmin.tar.gz -L https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.tar.gz && \
    tar -xvzf /tmp/phpmyadmin.tar.gz -C /var/www/ && \
    mv /var/www/phpMyAdmin-* /var/www/phpmyadmin && \
    rm -f /tmp/phpmyadmin.tar.gz

COPY conf/config.inc.php /var/www/phpmyadmin/config.inc.php
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD /usr/sbin/php-fpm83 && nginx -g 'daemon off;'

