DOCKER_YAML = ./srcs/docker-compose.yml

all: create_dirs
	docker-compose -f $(DOCKER_YAML) up -d 

create_dirs:
	mkdir -p /home/smephest/data/db
	mkdir -p /home/smephest/data/site
	mkdir -p /home/smephest/data/redis

debug:
	docker-compose -f $(DOCKER_YAML) up --force-recreate --build

stop:
	docker-compose -f $(DOCKER_YAML) down

logs:
	docker-compose -f $(DOCKER_YAML) logs

rebuild:
	docker-compose -f $(DOCKER_YAML) up --force-recreate --build -d

re: fclean all

clean:
	docker-compose -f $(DOCKER_YAML) down

fclean: clean clean_containers clean_images clean_volumes clear_dirs clean_network

clear_dirs:
	rm -rf /home/smephest/data/

clean_containers:
	docker container prune -f

clean_images:
	docker image prune -a -f

clean_volumes:
	docker volume prune -f 

clean_network:
	docker network prune -f	


setup_daemon:
	echo '{ "metrics-addr" : "127.0.0.1:9323", "experimental" : true }' > /etc/docker/daemon.json
