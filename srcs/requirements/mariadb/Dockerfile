FROM debian:bullseye

RUN apt-get update
RUN apt-get install mariadb-server -y


# RUN sed -i "s|socket = /run/mysqld/mysqld.sock| socket = 0.0.0.0|g"	/etc/mysql/mariadb.cnf
# RUN sed -i "s|socket = /run/mysqld/mysqld.sock|# socket = /run/mysqld/mysqld.sock|g"	/etc/mysql/mariadb.cnf
# RUN sed -i "s/# port = 3306/port = 3306/g"	/etc/mysql/mariadb.cnf
RUN sed -i "s/127.0.0.1/0.0.0.0/g"	/etc/mysql/mariadb.conf.d/50-server.cnf


COPY tools/script.sh ./script.sh

# RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x script.sh

# EXPOSE 3306

ENTRYPOINT [ "bash", "script.sh" ]

# CMD ["sleep", "infinity"]
