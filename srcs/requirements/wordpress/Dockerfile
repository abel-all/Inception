FROM debian:bullseye

RUN apt update
RUN apt install -y iputils-ping php7.4 php7.4-fpm php7.4-mysql mariadb-client curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|g"	/etc/php/7.4/fpm/pool.d/www.conf
COPY tools/script.sh .
RUN chmod +x script.sh

CMD ["bash", "script.sh"]
