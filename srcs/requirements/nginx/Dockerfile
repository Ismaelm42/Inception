FROM debian:buster

#instalación de curl para poder comprobar si el localhost se muestra correctamente en el container
RUN apt update -y && apt install nginx -y && apt install openssl -y && apt install curl -y

COPY ./tools/nginx_script.sh /

RUN chmod +x /nginx_script.sh

RUN /nginx_script.sh

COPY ./conf/default /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]
