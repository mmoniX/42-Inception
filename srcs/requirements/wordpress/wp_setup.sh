# #!bin/bash

# set -e

# if [ ! -d "/var/www/html" ]; then
#     mkdir -p /var/www/html
# fi

# cd /var/www/html

# if [ ! -f "/usr/local/bin/wp" ]; then
#     echo "Installing WP-CLI..."
#     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#     chmod +x wp-cli.phar
#     mv wp-cli.phar /usr/local/bin/wp
# fi

# echo "Waiting for MariaDB to be ready..."
# while ! mysqladmin ping -h ${DB_HOST} -u ${DB_AUSR} -p${DB_APW} --silent; do
#     echo "Waiting for database connection..."
#     sleep 5
# done

# if [ ! -f "wp-config.php" ]; then
#     echo "setting wordpress..."
#     wp core download --allow-root --locale=en_US
#     wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_AUSR} --dbpass=${DB_APW} --dbhost=${DB_HOST}:3306
#     wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
#     wp user create "${WP_USER}" "${WP_EMAIL}" --user_pass="${WP_PASSWORD}" --role=author --allow-root
# else
#     echo "WordPress already configured, skipping setup."
# fi

# chown -R www-data:www-data /var/www/html
# chmod -R 755 /var/www/html

# echo "Starting PHP-FPM..."

# exec php-fpm8.4 -F -R


#!bin/bash

set -e

if [ ! -d "/var/www/html" ]; then
    mkdir -p /var/www/html
fi

cd /var/www/html

if [ ! -f "/usr/local/bin/wp" ]; then
    echo "Installing WP-CLI..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

sleep 10

if [ ! -f "wp-config.php" ]; then
    echo "setting wordpress..."
    wp core download --allow-root --locale=en_US
    wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_AUSR} --dbpass=${DB_APW} --dbhost=${DB_HOST}:3306
    echo "define('WP_REDIS_HOST', 'redis');" >> wp-config.php
    echo "define('WP_REDIS_PORT', 6379);" >> wp-config.php
    wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
    wp user create "${WP_USER}" "${WP_EMAIL}" --user_pass="${WP_PASSWORD}" --role=author --allow-root
else
    echo "WordPress already configured, skipping setup."
fi

echo "Configuring Redis Cache..."
wp plugin install redis-cache --activate --allow-root --path=/var/www/html
wp redis enable --allow-root --path=/var/www/html

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "Starting PHP-FPM..."

exec php-fpm8.4 -F -R