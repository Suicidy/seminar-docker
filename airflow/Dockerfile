# /etc/init.d/postgresql start
FROM ubuntu:16.04
LABEL Name="airflow" Version=0.2.0

ARG postgres_version=9.6
ARG spark_version=2.2.1

ENV AIRFLOW_HOME='/home/airflow/airflow'
ENV SPARK_HOME="/home/airflow/spark-${spark_version}-bin-hadoop2.7"
ENV PATH=${SPARK_HOME}:$PATH
ENV PYTHONPATH=${SPARK_HOME}/python:$PYTHONPATH

COPY init/* /tmp/
COPY config/airflow.cfg /home/airflow/airflow/
COPY /init/entrypoint.sh /

RUN chmod 777 /tmp/*
RUN /bin/bash /tmp/init-user.sh

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main ${postgres_version}" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update -qq -y && apt-get install -y\
    wget\
    git \
    python3 \
    python3-pip \
    default-jre \
    scala \
    vsftpd \
    postgresql-${postgres_version} \
    postgresql-client-${postgres_version} \
    postgresql-contrib-${postgres_version} && \
    pip3 install --upgrade pip && \
    pip3 install -U setuptools && \
    pip3 install \
    py4j \
    apache-airflow[postgres] && \
    wget http://www-eu.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop2.7.tgz -P /tmp && \
    tar -zxvf tmp/spark-${spark_version}-bin-hadoop2.7.tgz -C /home/airflow && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/${postgres_version}/main/pg_hba.conf && \
    echo "listen_addresses='*'" >> /etc/postgresql/${postgres_version}/main/postgresql.conf

USER postgres

RUN /etc/init.d/postgresql start && psql -f /tmp/init-db.sql

USER root

RUN rm -rf /tmp/*

# USER airflow

# RUN airflow initdb

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]

EXPOSE 8080 20 21