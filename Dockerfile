# Kannel depends on bison-2.5, therefore we use Ubuntu Precise
FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y wget bzip2 build-essential bison libxml2 libxml2-dev wvdial
RUN wget http://www.kannel.org/download/1.4.4/gateway-1.4.4.tar.bz2
RUN tar xvjf gateway-1.4.4.tar.bz2

WORKDIR gateway-1.4.4
RUN CFLAGS='-Wall -O2 -g' ./configure
RUN make
RUN mkdir /kannel
RUN make bindir=/kannel install

COPY kannel.conf ./

RUN echo "RUN wvdialconf to get your modems configuration"
