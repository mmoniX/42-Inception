FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	redis-server && rm -rf /var/lib/apt/lists/*

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

CMD ["redis-server",  "--protected-mode", "no"]
