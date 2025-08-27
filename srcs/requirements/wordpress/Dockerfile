FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php8.2-fpm php-mysql php-curl php-xml php-mbstring php-gd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

    COPY index.php /var/www/html/index.php

RUN mkdir /var/www/${DOMAIN_NAME}
RUN chmod +x /var/www/${DOMAIN_NAME}

CMD ["php-fpm"]

#install wordpress inside www/html/
#Database_name
#User_name
#password
#database_host
#Table_prefix
#change file permission debian:www-data html/

# Site titel
# User_name
# password
# email
# search engine visibility
