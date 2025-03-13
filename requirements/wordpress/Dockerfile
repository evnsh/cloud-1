FROM alpine:3.21

# Install WordPress dependencies
RUN apk update
RUN apk --no-cache add \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-openssl \
    php83-curl \
    php83-zlib \
    php83-xml \
    php83-phar \
    php83-intl \
    php83-dom \
    php83-xmlreader \
    php83-xmlwriter \
    php83-simplexml \
    php83-tokenizer \
    php83-ctype \
    php83-session \
    php83-mbstring \
    php83-gd \
    php83-fileinfo \
    php83-opcache \
    php83-zip \
    curl \
    tar

COPY /tools/init_wp.sh /init_wp.sh
RUN chmod +x /init_wp.sh

COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

EXPOSE 9000

WORKDIR /var/www/wordpress

CMD ["sh", "/init_wp.sh"]
