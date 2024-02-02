FROM debian:bullseye

# WORKDIR /root
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress_user
ENV MYSQL_PASSWORD=wordpress_password

RUN apt update && apt upgrade -y
RUN apt-get install mariadb-server -y
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /root/script.sh

EXPOSE 3306

# RUN chmod +x script.sh
RUN service mariadb start
RUN sleep 5
RUN mysql -u root -p"${MYSQL_ROOT_PASSWORD}" < /root/script.sh && \
    service mysql stop
# RUN bash script.sh

# CMD [ "/usr/bin/mysqld_safe" ]
# CMD [ "sleep", "infinity" ]
CMD ["mysqld", "--user=mysql", "--console"]
