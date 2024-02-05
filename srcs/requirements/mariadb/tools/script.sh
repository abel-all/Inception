#!/bin/bash

db_name=wordpressdb
db_user=abelwb
db_pwd=a123

# mariadb start
service mariadb start

# Make sure that NOBODY can access the server without a password
mariadb -e "UPDATE mysql.user SET Password = PASSWORD('1234') WHERE User = 'root'"

# And then we need to kill the anonymous users
mariadb -e "DROP USER ''@'localhost'"

# Because our hostname varies we'll use some Bash magic here.
mariadb -e "DROP USER ''@'$(hostname)'"

# Kill off the demo database
mariadb -e "DROP DATABASE test"

# Make our changes take effect
mariadb -e "FLUSH PRIVILEGES"

# sleep infinity
