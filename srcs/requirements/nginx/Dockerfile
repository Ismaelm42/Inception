FROM debian:bullseye

#instalación de curl para poder comprobar si el localhost se muestra correctamente en el container
RUN apt update -y && apt install nginx -y && apt install openssl -y && apt install curl -y

COPY /conf/default /

COPY /tools/nginx_script.sh /

RUN chmod +x /nginx_script.sh

EXPOSE 443

CMD ["/nginx_script.sh"]
