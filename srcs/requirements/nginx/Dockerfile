FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install nginx -y

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
