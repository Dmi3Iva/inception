#!/bin/bash

service mysql start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -u root -e "GRANT ALL ON ${DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root wordpress < /wordpress.sql

mysqladmin -u root password ${MYSQL_ROOT_PASSWORD}
sleep 5
# should we remove it?
service mysql stop -p'${MYSQL_ROOT_PASSWORD}'

exec mysqld