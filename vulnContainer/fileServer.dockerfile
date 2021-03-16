FROM ubuntu:bionic-20180426
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl
RUN apt-get install -y build-essential
RUN curl -LO https://mirrors.dotsrc.org/samba/samba-4.2.14.tar.gz
RUN tar -xvf samba-4.2.14.tar.gz