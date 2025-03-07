FROM alpine:3.19.1

RUN apk update
RUN apk --no-cache add nginx

RUN mkdir -p /run/nginx /var/www/wordpress /var/www/certbot

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod -R 755 /var/www/wordpress

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]