FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql mariadb-client nginx curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# COPY conf/www.conf etc/php/7.4/fpm/pool.d/
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|g"	/etc/php/7.4/fpm/pool.d/www.conf
COPY conf/script.sh ./script.sh
RUN chmod +x ./script.sh

# RUN mkdir run/php

ENTRYPOINT ["bash", "script.sh"]
CMD [ "php-fpm7.4", "-F" ]
