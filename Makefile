DC_FILE = ./srcs/docker-compose.yml

all: build
	mkdir -p /home/${USER}/data
	chmod 775  /home/${USER}/data
	mkdir -p /home/${USER}/data/db_data
	mkdir -p /home/${USER}/data/wp_data

build :
	docker-compose -f $(DC_FILE) build

up:
	docker-compose -f $(DC_FILE) up

# stop and remove containers, networks
down:
	docker-compose -f $(DC_FILE) down

start:
	docker-compose -f $(DC_FILE) start

stop:
	docker-compose -f $(DC_FILE) stop

restart: stop up

list_containers:
	docker-compose ps
	@echo "---------------"
	docker ps

list_volumes:
	docker volume ls

list_networks:
	docker network ls

debug_mariadb:
	docker stop mariadb
	docker rm mariadb
	docker volume rm db_data
	sudo rm -rf /home/$(USER)/data/db_data

debug_wordpress:
	docker stop wordpress
	docker rm wordpress
	docker volume rm wp_data
	sudo rm -rf /home/$(USER)/data/wp_data

debug_nginx:
	docker stop nginx
	docker rm nginx
	docker volume rm wp_data
	sudo rm -rf /home/$(USER)/data/wp_data

clean_images:
	docker-compose -f $(DC_FILE) down --rmi all

clean_volumes:
	docker-compose -f $(DC_FILE) down --volumes
	docker volume prune -f

clean: clean_images clean_volumes
	sudo rm -Rf /home/${USER}/data/*

fclean: clean
	sudo rm -rf /home/ormartin/data/*
	docker volume rm -f srcs_db_data
	docker network prune -f 
	docker system prune -af

re: fclean all

setup:

.PHONY: all build up down list_containers list_volumes list_networks clean fclean re setup


# docker exec -it container_name /bin/sh : to enter interactive mode while container is running
# docker inspect container_name : to list all container information
