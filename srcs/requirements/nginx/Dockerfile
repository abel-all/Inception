FROM debian:bullseye

RUN apt update && apt install nginx -y

RUN apt install openssl -y

COPY tools/script.sh .

RUN chmod +x script.sh

CMD [ "bash", "script.sh" ]
