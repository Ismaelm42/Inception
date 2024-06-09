FROM debian:bullseye

RUN apt update && apt install curl -y

RUN apt install php7.4 php-fpm php-mysql mariadb-client -y

RUN mkdir -p /var/www/html /run/php/ /usr/sbin/sendmail && chown -R www-data:www-data /var/www/html/ /usr/sbin/sendmail && chmod -R 755 /var/www/html/ && chmod +x /usr/sbin/sendmail

COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /usr/local/bin/wp

WORKDIR /var/www/html

COPY ./tools/wordpress_script.sh /

RUN chmod +x /wordpress_script.sh

EXPOSE 9000

CMD ["/wordpress_script.sh"]
