DOCKER_COMPOSE = srcs/docker-compose.yaml

all:
	sudo mkdir -p /home/saboulal/data/wordpress
	sudo mkdir -p /home/saboulal/data/DB
	docker-compose -f $(DOCKER_COMPOSE) up -d --build

up:
	docker-compose -f $(DOCKER_COMPOSE) up -d

logs:
	docker-compose -f $(DOCKER_COMPOSE) logs

down:
	docker-compose -f $(DOCKER_COMPOSE) down

clean:
	docker-compose -f $(DOCKER_COMPOSE) down -v

fclean:
	docker-compose -f $(DOCKER_COMPOSE) down --volumes
	docker container prune -f
	docker volume prune -f
	docker image prune -f
	#docker system prune -f
	sudo rm -rf /home/saboulal/data/*/* 
	docker network prune -f

re: fclean all