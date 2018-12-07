FROM ubuntu:latest

ADD https://github.com/wrouesnel/postgres_exporter/releases/download/v0.4.7/postgres_exporter_v0.4.7_linux-amd64.tar.gz /
COPY queries.yaml /
RUN tar xvf /postgres_exporter*.tar.gz; mv /postgres_exporter*/postgres_exporter /

ENV PG_EXPORTER_EXTEND_QUERY_PATH=/queries.yaml
EXPOSE 9187
ENTRYPOINT [ "/postgres_exporter" ]
