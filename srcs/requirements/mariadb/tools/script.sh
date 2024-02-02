#!/bin/sh

db_name=wordpressdb
db_user=abelwb
db_pwd=Abdessamad010203#

service mariadb start

sleep 5
# Make sure that NOBODY can access the server without a password
mysql -e "CREATE DATABASE IF NOT EXISTS $db_name ;"
# Kill the anonymous users
mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;"
# Kill off the demo database
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES;"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
