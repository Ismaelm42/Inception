FROM debian:buster

#instalación de curl para poder comprobar si el localhost se muestra correctamente en el container
RUN apt update -y && apt install nginx -y && apt install openssl -y && apt install curl -y && mkdir -p /etc/nginx/ssl/private /etc/ssl/certs/

RUN openssl req -x509 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/nginx/ssl/private/nginx.key -subj "/C=ES/ST=AND/L=Malaga/O=42/OU=42/CN=login.42.fr/UID=imoro-sa"

#necesario para acordar la autorización y los privilegios para obtener el index.html de nginx
RUN chmod -R 755 /var/www/html/ && chown -R www-data:www-data /var/www/html/

COPY ./conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
