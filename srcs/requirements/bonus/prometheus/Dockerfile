FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install prometheus procps

COPY ./conf/prometheus.yml /etc/prometheus/prometheus.yml

RUN chown -R prometheus:prometheus /etc/prometheus
RUN chown -R prometheus:prometheus /var/lib/prometheus

ENTRYPOINT [ "prometheus" ]
CMD [ "--config.file=/etc/prometheus/prometheus.yml" ]