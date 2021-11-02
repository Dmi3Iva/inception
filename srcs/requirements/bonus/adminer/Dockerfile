FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install adminer

COPY ./conf/adminer.conf /etc/adminer/
COPY ./conf/apache2.conf /etc/apache2/apache2.conf

ENTRYPOINT [ "/usr/sbin/apachectl" ]
CMD [ "-D", "FOREGROUND"]
