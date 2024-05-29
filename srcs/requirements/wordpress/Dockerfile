FROM debian:bullseye

#actualización e instalación de wget para más adelante poder realizar la descarga de wordpress
RUN apt update && apt install wget -y

#instalación de php, extensión mysql para php y el cliente de mariadb
RUN apt install php7.4 php-fpm php-mysql -y

#creación de la carpeta var/www y descarga de la útlima versión de wordpress
RUN mkdir -p /var/www && wget https://es.wordpress.org/wordpress-6.5.3-es_ES.tar.gz -O /var/www/wordpress.tar.gz 

#descompresión de wordpress y elimina el archivo .tar
RUN tar -xvf /var/www/wordpress.tar.gz -C /var/www/ && rm -fr /var/www/wordpress.tar.gz

#le da los permisos a todos los archivos de la carpeta a root
RUN chown -R root:root /var/www/wordpress && mkdir -p /run/php/

#copia de la configuración general
COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/

#copia de la pool específica para conexiones con usuario x y del puerto x
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

CMD ["/usr/sbin/php-fpm7.4", "-F"]
