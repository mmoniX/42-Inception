FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y mariadb-server mariadb-client

COPY db_setup.sh /db_setup.sh

RUN chmod +x /db_setup.sh

ENTRYPOINT /db_setup.sh