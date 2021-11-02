FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install php php-fpm php-mbstring php-mysql php-xml php-pdo php-gd php-cli wget curl 
# RUN apt-get -y install php7-ctype

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# install wordpress
WORKDIR /var/www/html

# create folder for sock-file
RUN mkdir -p /run/php/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN cd /var/www/html
RUN wp core download --allow-root
COPY ./conf/object-cache.php /

ARG DB_HOST
ARG DB_NAME
ARG MYSQL_USER
ARG MYSQL_PASSWORD
RUN wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --skip-check --allow-root

# REDIS
RUN wp config set WP_REDIS_HOST "redis" --allow-root
RUN wp config set WP_CACHE_SALT "redis" --allow-root
RUN wp config set WP_CACHE "true" --raw --allow-root
ARG REDIS_PASSWORD
RUN echo "${REDIS_PASSWORD}"
RUN wp config set WP_REDIS_PASSWORD "${REDIS_PASSWORD}" --allow-root

COPY ./tools/start.sh /
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]
CMD ["-F"]
