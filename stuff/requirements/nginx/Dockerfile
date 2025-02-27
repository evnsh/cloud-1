FROM alpine:3.19.1

RUN apk update
RUN apk --no-cache add nginx openssl

RUN mkdir -p /run/nginx /var/www/wordpress

# Generate SSL certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/evmorvan.42.fr.crt -keyout /etc/ssl/private/evmorvan.42.fr.key -subj "/C=FR/ST=Nice/L=Nice/O=42/OU=42 Nice/CN=evmorvan"

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod -R 755 /var/www/wordpress

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
