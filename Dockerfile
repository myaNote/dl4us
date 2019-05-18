FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

LABEL maintainer "mitsuwo"

WORKDIR /tmp
ADD ./requirements.txt /tmp
EXPOSE 8888

RUN apt update
RUN apt -y upgrade
RUN apt install -y python3 python3-pip
RUN pip3 install -r /tmp/requirements.txt

# for lesson 1
RUN apt install -y graphviz
# for lesson 5
RUN apt install -y wget unzip
# for lesson 7
RUN apt install -y xvfb python3-opengl
RUN pip3 install pyvirtualdisplay

WORKDIR /jupyter

