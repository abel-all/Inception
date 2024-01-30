FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install nginx -y
# RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN ls -l /etc/ssl/private/ /etc/ssl/certs/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=[abel-all.1337.ma](http://abel-all.42.ma/)"
RUN cat /etc/ssl/private/nginx-selfsigned.key
RUN cat /etc/ssl/certs/nginx-selfsigned.crt
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=IDF/L=KHOURIBGA/O=42/OU=42/CN=abel-all.42.fr/UID=abel-all"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/sites-available/default/nginx.conf

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
