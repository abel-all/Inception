
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all : build run

build :
	docker-compose build

run :
	docker-compose up

stop :
	docker-compose down

.phony : build run stop

