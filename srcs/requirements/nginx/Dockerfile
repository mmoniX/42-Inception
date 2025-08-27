FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	nginx openssl && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl-certificate

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl-certificate/nginx-pvt.key \
	-out /etc/nginx/ssl-certificate/nginx-pub.crt \
	-subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/OU=Inception/CN=mmonika.42.fr"

CMD ["nginx", "-g", "daemon off;"]
