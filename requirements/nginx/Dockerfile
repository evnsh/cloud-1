FROM nginx:alpine

# Install envsubst
RUN apk add --no-cache gettext

# Copy Nginx configuration template
COPY conf/nginx.conf.template /etc/nginx/nginx.conf.template

# Create entrypoint script
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]