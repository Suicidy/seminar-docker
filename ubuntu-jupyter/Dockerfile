FROM ubuntu:latest
LABEL Name="ubuntu-jupyter" Version=0.1.0
#ENV SPARK_HOME='/home/guest/spark-2.2.1-bin-hadoop2.7' \
#     PATH=$SPARK_HOME:$PATH \
#     PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    wget \
    python3 \
    python3-dev \
    ipython3 \
    python3-pip \
    default-jre \
    scala

RUN pip3 install --upgrade pip
RUN pip3 install \
    jupyter \
    py4j

RUN useradd -ms /bin/bash guest && chown -R guest /home/guest/
WORKDIR /home/guest/
RUN wget http://www-eu.apache.org/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
RUN tar -zxvf spark-2.2.1-bin-hadoop2.7.tgz
USER guest
RUN mkdir workdir
CMD ["export SPARK_HOME='/home/guest/spark-2.2.1-bin-hadoop2.7'", "&&" , "export", "PATH=$SPARK_HOME:$PATH", "&&" ,"export", "PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH", "&&", "export", "PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH", "&&" ,"jupyter", "notebook", "--ip=0.0.0.0", "--notebook-dir=/home/guest/workdir"]