#!/bin/bash
chown -R ${FTP_USER}:${FTP_USER} /var/www/html/

set -- vsftpd "$@"
exec "$@"