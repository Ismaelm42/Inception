FROM debian:bullseye

RUN apt update -y && apt install iputils-ping -y && apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb_script.sh /

RUN chmod +x /mariadb_script.sh

EXPOSE 3306

CMD ["/mariadb_script.sh"]
