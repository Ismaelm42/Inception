FROM debian:bullseye

#actualización e instalación de wget para más adelante poder realizar la descarga de wordpress
RUN apt update && apt install wget -y && apt install curl -y

#instalación de php, extensión mysql para php y el cliente de mariadb
RUN apt install php7.4 php-fpm php-mysql -y

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://es.wordpress.org/wordpress-6.5.3-es_ES.tar.gz

RUN tar -xvf wordpress-6.5.3-es_ES.tar.gz --strip-components=1 && rm -fr wordpress-6.5.3-es_ES.tar.gz

#cambio de permisos y grupo de la carpeta /var/www/html
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 755 /var/www/html/ && mkdir -p /run/php/

#copia de la configuración general
COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/

#copia de la pool específica para conexiones con usuario x y del puerto x
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/wordpress_script.sh /

RUN chmod +x /wordpress_script.sh

EXPOSE 9000

CMD ["/wordpress_script.sh"]
