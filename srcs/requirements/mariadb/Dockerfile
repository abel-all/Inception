FROM debian:bullseye

RUN apt update

RUN apt install mariadb-server -y

RUN sed -i "s/127.0.0.1/0.0.0.0/g"	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh .

CMD bash script.sh
