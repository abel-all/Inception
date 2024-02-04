
# DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
# DOCKER_COMPOSE := docker-compose -f $(DOCKER_COMPOSE_FILE)
all : build run

build :
	docker-compose -f srcs/docker-compose.yml build

run :
	docker-compose -f srcs/docker-compose.yml up

stop :
	docker-compose -f srcs/docker-compose.yml down

.phony : build run stop

