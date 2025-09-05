# FROM debian:trixie

# RUN apt-get update && apt-get upgrade -y && apt-get install -y \
# 	redis-server && rm -rf /var/lib/apt/lists/*

# COPY redis.conf /etc/redis/redis.conf

# CMD ["redis-server", "/etc/redis/redis.conf", "--protected-mode", "no"]


FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	redis-server && rm -rf /var/lib/apt/lists/*

COPY redis.conf /etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf", "--protected-mode", "no"]
