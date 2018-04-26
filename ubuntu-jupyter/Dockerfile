FROM ubuntu:16.04
LABEL Name="ubuntu-jupyter" Version=0.2.0

ARG spark_version=2.2.1

ENV SPARK_HOME="/home/guest/spark-${spark_version}-bin-hadoop2.7"
ENV PATH=${SPARK_HOME}:$PATH
ENV PYTHONPATH=${SPARK_HOME}/python:$PYTHONPATH

RUN useradd -ms /bin/bash guest && \
    chown -R guest /home/guest/

RUN apt-get update -qq -y && apt-get install -y --no-install-recommends \
    wget \
    python3 \
    python3-dev \
    ipython3 \
    python3-pip \
    default-jre \
    scala \
    git && \
    pip3 install --upgrade pip && \
    pip3 install -U setuptools && \
    pip3 install \
    jupyter \
    py4j && \
    wget http://www-eu.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop2.7.tgz -P /tmp && \
    tar -zxvf tmp/spark-${spark_version}-bin-hadoop2.7.tgz -C /home/guest && \
    apt-get remove -y wget && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /tmp/
COPY jupyter_notebook_config.txt /tmp/

USER guest

RUN mkdir /home/guest/workdir &&\
    jupyter notebook --generate-config && \
    cat /tmp/jupyter_notebook_config.txt >> /home/guest/.jupyter/jupyter_notebook_config.py


EXPOSE 8888

ENTRYPOINT [ "/bin/bash", "/tmp/start.sh" ]