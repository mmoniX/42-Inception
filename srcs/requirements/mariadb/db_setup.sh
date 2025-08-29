#!/bin/bash

set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --datadir="/var/lib/mysql"

    echo "Starting MariaDB in background..."
    mariadbd-safe --skip-networking &
    sleep 10

    echo "Setting root password..."
    mariadb -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_RPW}';
FLUSH PRIVILEGES;
EOF

    echo "Creating database and users..."
    mariadb -u root -p"${DB_RPW}" <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS ${DB_AUSR}@'%' IDENTIFIED BY '${DB_APW}';
CREATE USER IF NOT EXISTS ${DB_USR}@'%' IDENTIFIED BY '${DB_PW}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_AUSR}@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON ${DB_NAME}.* TO ${DB_USR}@'%';
FLUSH PRIVILEGES;
EOF

    echo "Shutting down MariaDB after setup..."
    mysqladmin -u root -p"${DB_RPW}" shutdown
else
    echo "MariaDB already initialized, skipping setup."
fi

echo "Starting MariaDB in foreground..."
exec mariadbd-safe --bind-address=0.0.0.0