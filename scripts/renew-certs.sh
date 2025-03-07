#!/bin/sh
certbot renew --webroot --webroot-path=/var/www/certbot
docker kill --signal=HUP nginx