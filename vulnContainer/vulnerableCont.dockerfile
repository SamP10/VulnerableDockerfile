FROM ubuntu:bionic-20180426
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential
RUN apt-get install -y autoconf
RUN apt-get install -y curl
RUN apt-get install -y zlib1g-dev && \
    apt-get install -y tcl-dev && \
    apt-get install -y libssl-dev && \
    apt-get install -y gettext
RUN curl -LO https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz
RUN tar zxf git-2.14.4.tar.gz
RUN cd git-2.14.4 && \
    make configure && \
    ./configure --prefix=/usr/local && \
    make prefix=/usr/local install