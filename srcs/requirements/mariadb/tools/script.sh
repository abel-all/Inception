#!/bin/bash

mysql_install_db --user=mysql --ldata=/var/lib/mysql

service mariadb start

# Make sure that NOBODY can access the server without a password
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123';"
# sudo mariadbd --user=root --password=123

mariadb -h localhost -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS wpdb;"

mariadb -h localhost -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'abel-all'@'%' IDENTIFIED BY '123'; GRANT ALL PRIVILEGES ON wpdb.* TO 'abel-all'@'%'; FLUSH PRIVILEGES;"

# service mariadb stop
mariadb-admin -p$MYSQL_ROOT_PASSWORD shutdown

mariadbd
# sleep infinity
# exec "$@"
