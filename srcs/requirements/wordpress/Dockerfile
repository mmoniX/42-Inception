FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	php-fpm php-mysqli php-redis mariadb-client curl && rm -rf /var/lib/apt/lists/*

COPY php.conf /etc/php/8.4/fpm/pool.d/www.conf
COPY wp_setup.sh /wp_setup.sh
RUN chmod +x /wp_setup.sh

ENTRYPOINT ["/wp_setup.sh"]