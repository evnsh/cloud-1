#!/bin/sh

sleep 10

if [ -f /.firstrun ]; then
    echo "[!] Skipping first run..."
else 
    echo "[!] Installing wp-cli..."
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    echo "[!] Downloading and decompressing wordpress"
    mkdir -p /var/www/wordpress
    curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz
    tar -xzf wordpress.tar.gz -C /var/www
    rm wordpress.tar.gz
    mkdir -p /run/php

    echo "[!] Configuring MySQL database and users..."
    sleep 5
    wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="$DB_HOST" --path=/var/www/wordpress --allow-root
    sleep 1
    wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --path=/var/www/wordpress --allow-root
    wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=contributor --user_pass="$WP_USER_PASSWORD" --path=/var/www/wordpress --allow-root

    sed -i "68i define('FS_METHOD', 'direct');" /var/www/wordpress/wp-config.php

    echo "[!] Update plugins and themes..."
    wp plugin update --all --allow-root --path=/var/www/wordpress

    touch /.firstrun
fi

echo "[!] Starting"
php-fpm83 -F -R
