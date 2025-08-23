FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y nginx openssl

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl-certificate

RUN openssl req -x509 -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl-certificate/nginx-pvt.key \
	-out /etc/nginx/ssl-certificate/nginx-pub.crt

CMD ["nginx", "-s", "reload"]
