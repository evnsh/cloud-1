#!/bin/sh

# Substitute environment variables in Nginx configuration
envsubst '${DOMAIN_NAME} ${PMA_DOMAIN}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Execute the main container command
exec "$@" 