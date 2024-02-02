FROM debian:bullseye

WORKDIR /root

RUN apt update && apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh .

RUN chmod +x script.sh
RUN service mariadb start
RUN ./script.sh

EXPOSE 3306
# CMD [ "/usr/bin/mysqld_safe" ]
# CMD [ "sleep", "infinity" ]
CMD ["mysqld", "--user=mysql", "--console"]
