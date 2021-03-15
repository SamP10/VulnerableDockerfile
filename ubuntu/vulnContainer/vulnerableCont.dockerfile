FROM ubuntu:16.04
ARG CURL_OPTIONS=""
RUN apt-get update && apt-get upgrade -y
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN curl -LO https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz
RUN tar zxf git-2.14.4.tar.gz
RUN cd git-2.14.4
RUN make configure
RUN ./configure --prefix=/usr
RUN make all doc info
RUN make install install-doc install-html install-info