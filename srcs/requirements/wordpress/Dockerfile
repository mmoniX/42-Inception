FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y php8.0-fpm 

COPY index.php /var/www/html/index.php

RUN mkdir /var/www/mmonika.42.fr
RUN chmod +x /var/www/mmonika.42.fr