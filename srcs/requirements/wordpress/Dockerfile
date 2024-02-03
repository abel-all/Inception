FROM debian:bullseye

RUN apt update && apt upgrade -y
# RUN apt-get install -y wget
RUN apt install -y php7.3 php-fpm php-mysql && apt install -y curl

# RUN wget https://wordpress.org/latest.tar.gz -P /var/www
# RUN cd /var/www && tar -xvf latest.tar.gz && rm latest.tar.gz
# RUN chown -R root:root /var/www/wordpress

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh

CMD ["bash", "/tmp/script.sh"]
