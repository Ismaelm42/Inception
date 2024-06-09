FROM debian:bullseye

RUN apt update -y && apt install nginx -y && apt install openssl -y

RUN mkdir -p /etc/nginx/ssl/private /etc/ssl/certs/

RUN openssl req -x509 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/nginx/ssl/private/nginx.key -subj "/C="ES"/ST="AND"/L="Malaga"/O="Telefonica"/OU="42Telefonica"/CN="login.42.fr"/UID="imoro-sa""

RUN chmod -R 755 /var/www/html/ && chown -R www-data:www-data /var/www/html/

COPY /conf/default /etc/nginx/sites-available/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
