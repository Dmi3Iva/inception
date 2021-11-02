FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install redis procps

COPY ./conf/redis.conf /etc/redis/redis.conf

ARG REDIS_PASSWORD
RUN  sed -i -- "s/# requirepass foobared/requirepass ${REDIS_PASSWORD}/g" /etc/redis/redis.conf

# CMD ["sh", "-c", "redis-server /etc/redis/redis.conf --requirepass ${REDIS_PASSWORD}"]
ENTRYPOINT [ "redis-server" ]
CMD [ "/etc/redis/redis.conf"]
