DOCKER_COMPOSE=docker compose -p inception -f srcs/docker-compose.yml

all: up

up:
	bash srcs/host_setup.sh
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down

clean: down
	$(DOCKER_COMPOSE) down -v

fclean: clean
	docker system prune -a -f --volumes

re: fclean all

.PHONY: all up down clean fclean re

# rm -rf /home/mmonika/data/mariadb
# rm -rf /home/mmonika/data/wordpress