FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install mariadb-server procps

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/wordpress.sql /

RUN chown -R mysql:mysql /var/lib/mysql

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY ./tools/start.sh /
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]