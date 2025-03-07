#!/bin/sh

if [ -f /.firstrun ]; then
    echo "[!] Skipping first run..."
else 
    echo "[!] Running install_db script (only error output is shown)..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
    mysqld --datadir='/var/lib/mysql' --user=mysql &
    
    echo "[!] Waiting for mysqld to start..."
    sleep 10
    
    echo "[!] Setting up database..."
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"
    mysql -u root -e "FLUSH PRIVILEGES;"
    
    echo "[!] Restarting mysqld..."
    mysqladmin shutdown
    touch /.firstrun
fi

echo "[!] Starting"
/usr/bin/mysqld --datadir='/var/lib/mysql'
