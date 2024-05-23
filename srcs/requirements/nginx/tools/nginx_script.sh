#!/bin/bash

#creación de las carpetas en las que se va a encontrar la clave y el certificado
mkdir -p /etc/nginx/ssl/private /etc/ssl/certs/

#creación de las claves y certificados
openssl req -x509 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/nginx/ssl/private/nginx.key -subj "/C=ES/ST=AND/L=Malaga/O=42/OU=42/CN=login.42.fr/UID=imoro-sa"

#acordar los permisos a la carpeta root
#chmod -R 755 /var/www/html/

#cambiar el propietario y grupo a la carpeta root. www-data nombre de user y group común que se crea para servidores nginx/apache
#chown -R www-data:www-data /var/www/html/

#autodestrucción
rm $0
