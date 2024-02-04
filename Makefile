all : build run

build :
	/srcs/docker-compose build

run :
	/srcs/docker-compose up

stop :
	/srcs/docker-compose down

.phony : build run stop

