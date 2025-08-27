FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

COPY db_setup.sh /db_setup.sh

RUN chmod +x /db_setup.sh

ENTRYPOINT /db_setup.sh
