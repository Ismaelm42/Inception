#!/bin/bash

# inicia mysql en segundo plano
service mariadb start; # service mysql start;

sleep 10

# crea la base de datos si no existe
#mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE DATABASE IF NOT EXISTS \`"SQL_DATABASE"\`;"

# crea un usuario si no existe con su respectivo password
#mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS \`"SQL_USER"\`@'localhost' IDENTIFIED BY '"SQL_PASSWORD"';"

# atribuye todos los privilegios de la nueva base de datos al usuario creado
#mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`"SQL_DATABASE"\`.* TO \`"SQL_USER"\`@'%' IDENTIFIED BY '"SQL_PASSWORD"';"

# modifica el usuario root y establece el password
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '"SQL_ROOT_PASSWORD"';"

# se reinician los privilegios de forma a que los cambios se hagan efectivos
#mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
mysql -u root -p"SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# se apaga mysql
#mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
mysqladmin -u root -p"SQL_ROOT_PASSWORD" shutdown

# # inicia mysql en primer plano // no es necesario ya que se realiza en CMD ya de por sí
# exec mysqld_safe
