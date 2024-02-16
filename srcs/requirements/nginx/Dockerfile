FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install nginx -y
RUN mkdir /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=IDF/L=KHOURIBGA/O=42/OU=42/CN=abel-all.42.fr/UID=abel-all"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
