FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install vsftpd

ARG FTP_USER
ARG FTP_PASSWORD
RUN useradd -m --shell "/bin/bash" -p $(openssl passwd -1 "$FTP_PASSWORD") ${FTP_USER}

RUN mkdir -p /etc/vsftpd/
RUN echo ${FTP_USER} > /etc/vsftpd.userlist

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
RUN mkdir -p /var/run/vsftpd/empty
RUN mkdir -p /var/www/html

COPY ./tools/init.sh /
RUN chmod +x /init.sh

ENTRYPOINT [ "/init.sh" ]
CMD [ "/etc/vsftpd.conf" ]