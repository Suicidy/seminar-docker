FROM ubuntu:latest
LABEL Name="spark" Version=0.0.1
 
FROM ubuntu:latest
 
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install \
    wget \
    software-properties-common
 
# JAVA
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
 
ENV PATH $PATH:$JAVA_HOME/bin

# SPARK
ARG SPARK_ARCHIVE=http://www-eu.apache.org/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
ENV SPARK_HOME /usr/local/spark-2.2.1-bin-hadoop2.7
 
ENV PATH $PATH:${SPARK_HOME}/bin
RUN wget -s ${SPARK_ARCHIVE} -P /tmp 
RUN tar -zxvf tmp/spark-2.2.1-bin-hadoop2.7.tgz -C /usr/local/
 
WORKDIR $SPARK_HOME