#!/bin/bash

sleep 10

mkdir run/php

cd /var/www/html/wordpress
# downloads the latest version of WordPress to the current directory. The --allow-root flag allows the command to be run as the root user, which is necessary if you are logged in as the root user or if you are using WP-CLI with a system-level installation of WordPress.
rm -rf *
wp core download --allow-root

# echo "<?php

# /* MySQL settings */
# define( 'DB_NAME',     'wpdb' );
# define( 'DB_USER',     'abel-all' );
# define( 'DB_PASSWORD', '123' );
# define( 'DB_HOST',     'mariadb' );
# define( 'DB_CHARSET',  'utf8mb4' );


# /* MySQL database table prefix. */


# /* Authentication Unique Keys and Salts. */
# /* https://api.wordpress.org/secret-key/1.1/salt/ */
# define( 'AUTH_KEY',         'put your unique phrase here' );
# define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
# define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
# define( 'NONCE_KEY',        'put your unique phrase here' );
# define( 'AUTH_SALT',        'put your unique phrase here' );
# define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
# define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
# define( 'NONCE_SALT',       'put your unique phrase here' );


# /* Absolute path to the WordPress directory. */
# if ( !defined('ABSPATH') )
# 	define('ABSPATH', dirname(__FILE__) . '/');

# /* Sets up WordPress vars and included files. */
# require_once(ABSPATH . 'wp-settings.php');" > wp-config.php

wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --dbhost=mariadb --allow-root

# echo "+++++++++++++++++++"
# wp core install --url="${DOMAIN_NAME}" --title=abel --admin_user="${WP_USER}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}" --allow-root
# echo "+++++++++++++++++++"
# # wp config create --dbname=wpdb --dbuser=abel-all --dbpass=123 --dbhost=mariadb --allow-root

wp core install --url=abel-all.42.fr --title=abel --admin_user=abel-all --admin_password=123 --admin_email=abel-all@gmail.com --allow-root

# wp user create abel abel@gmail.com --role=author --user_pass=123 --allow-root

echo "---------------------------------"
cat wp-config.php
echo "---------------------------------"

exec $@
#----
# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# # change the those lines in wp-config.php file to connect with database
# sleep 20
# #line 23
# sed -i -r "s/database/$db_name/1"   wp-config.php
# #line 26
# sed -i -r "s/database_user/$db_user/1"  wp-config.php
# #line 29
# sed -i -r "s/passwod/$db_pwd/1"    wp-config.php

# #line 32
# sed -i -r "s/localhost/mariadb/1"    wp-config.php  
# #(to connect with mariadb database)

# # installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# # creates a new user account with the specified username, email address, and password. The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

# # installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
# wp theme install astra --activate --allow-root


# # wp plugin install redis-cache --activate --allow-root

# # uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
# sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# # creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
# mkdir /run/php


# # wp redis enable --allow-root


# # starts the PHP-FPM service in the foreground. The -F flag tells PHP-FPM to run in the foreground, rather than as a daemon in the background.
# # /usr/sbin/php-fpm7.4 -F
