#!/bin/bash

set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Starting MariaDB...."
    mysql_install_db --user=mysql --datadir="/var/lib/mysql"
    mysqld_safe --skip-networking &

    echo "Waiting for MariaDB to be ready...."
    sleep 5

    #set root pw
    echo "Setting root password..."
    mariadb -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_RPW}';
FLUSH PRIVILEGES;
EOF

    #create database & user
    echo "Creating database and users..."
    mariadb -u root -p"$DB_RPW" <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_AUSR}'@'%' IDENTIFIED BY '${DB_APW}';
CREATE USER IF NOT EXISTS '${DB_USR}'@'%' IDENTIFIED BY '${DB_PW}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_AUSR}'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON ${DB_NAME}.* TO '${DB_USR}'@'%';
FLUSH PRIVILEGES;
EOF

    mysqladmin -u root -p"${DB_RPW}" shutdown
else
    echo "MariaDB already initialized, skipping setup."
fi

exec mysqld_safe --bind-address=0.0.0.0