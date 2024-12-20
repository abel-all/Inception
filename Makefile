all : build run

build :
	docker-compose -f srcs/docker-compose.yml build

run :
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down

fclean :
	docker system prune -a
