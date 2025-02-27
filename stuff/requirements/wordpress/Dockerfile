FROM alpine:3.19.1

# Install WordPress dependencies
RUN apk update
RUN apk --no-cache add \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-json \
    php82-openssl \
    php82-curl \
    php82-zlib \
    php82-xml \
    php82-phar \
    php82-intl \
    php82-dom \
    php82-xmlreader \
    php82-xmlwriter \
    php82-simplexml \
    php82-tokenizer \
    php82-ctype \
    php82-session \
    php82-mbstring \
    php82-gd \
    php82-fileinfo \
    php82-opcache \
    php82-zip \
    curl \
    tar

COPY /tools/init_wp.sh /init_wp.sh
RUN chmod +x /init_wp.sh

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

EXPOSE 9000

WORKDIR /var/www/wordpress

CMD ["sh", "/init_wp.sh"]
