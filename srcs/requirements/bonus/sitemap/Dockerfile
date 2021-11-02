FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install nginx openssl procps

#install sertificate
RUN openssl req -x509 -nodes -days 365 -subj "/C=RI/ST=RUSSIA/L=Kazan/CN=smephest" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

RUN rm -f /etc/nginx/sites-available/default
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./conf/html/ /var/www/html/

CMD ["nginx", "-g", "daemon off;"]