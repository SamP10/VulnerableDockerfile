FROM ubuntu:16.04
ARG CURL_OPTIONS=""
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential && \
    apt-get install -y autoconf && \
    apt-get install -y curl && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y tcl-dev && \
    apt-get install -y libssl-dev && \
    apt-get install -y gettext
    #Install of Vulnerable GIT Version.
RUN curl -LO https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz && \
    tar zxf git-2.14.4.tar.gz
RUN cd git-2.14.4 && \
    make configure && \
    ./configure --prefix=/usr/local && \
    make prefix=/usr/local install