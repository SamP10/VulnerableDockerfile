FROM ubuntu:16.04
ARG CURL_OPTIONS=""
RUN apt-get update && apt-get upgrade -y
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y build-essential
RUN apt-get install -y autoconf
RUN apt-get install -y curl
RUN apt-get install zlib1g-dev && \
    apt-get install tcl-dev && \
    apt-get install libssl-dev && \
    apt-get install gettext
RUN curl -LO https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz
RUN tar zxf git-2.14.4.tar.gz
RUN cd git-2.14.4 && \
    make configure && \
    ./configure --prefix=/usr/local && \
    make prefix=/usr/local install