FROM ubuntu:latest
LABEL Name="ubuntu-jupyter" Version=0.1.0

ENV SPARK_HOME='/home/guest/spark-2.2.1-bin-hadoop2.7'
ENV PATH=${SPARK_HOME}:$PATH
ENV PYTHONPATH=${SPARK_HOME}/python:$PYTHONPATH

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget \
    python3 \
    python3-dev \
    ipython3 \
    python3-pip \
    default-jre \
    scala \
    git

RUN pip3 install --upgrade pip
RUN pip3 install \
    jupyter \
    py4j 

RUN useradd -ms /bin/bash guest && \
    chown -R guest /home/guest/

RUN wget http://www-eu.apache.org/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz -P /tmp
RUN tar -zxvf tmp/spark-2.2.1-bin-hadoop2.7.tgz -C /home/guest 
RUN rm -rf /tmp/*

COPY start.sh /tmp/
COPY jupyter_notebook_config.txt /tmp/

USER guest
RUN mkdir /home/guest/workdir

RUN jupyter notebook --generate-config && \
   cat /tmp/jupyter_notebook_config.txt >> /home/guest/.jupyter/jupyter_notebook_config.py



ENTRYPOINT [ "/bin/bash", "/tmp/start.sh" ]