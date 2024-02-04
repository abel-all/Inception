#!/bin/bash

db_name=wordpressdb
db_user=abelwb
db_pwd=a123

# mysqld_safe --skip-grant-tables --skip-syslog --skip-networking
# mysqld_safe
service mariadb start
# mariadb start
echo "hello"
# sleep 10
# Kill off the demo database
mysql -e "ALTER USER root@'localhost' IDENTIFIED BY '12345' ;"
# Make sure that NOBODY can access the server without a password
echo "root password changed successfully"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $db_name ;"
echo "database created successfully"
# Kill the anonymous users
mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%' ;"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES;"
# Any subsequentt tries to run queries this way will get access denied because lack of usr/pwd param

sleep infinity
