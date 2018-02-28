FROM ubuntu:latest
LABEL Name="ubuntu-jupyter" Version=0.0.1
RUN apt-get update && apt-get upgrade -y && apt-get install -y python3 python3-dev ipython3 python3-pip
RUN pip3 install --upgrade pip && pip3 install jupyter

