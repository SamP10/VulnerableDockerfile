FROM ubuntu:16.04
ARG CURL_OPTIONS=""
RUN apt-get update && apt-get upgrade -y
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y curl
RUN curl -LO ${CURL_OPTIONS} \
          https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz && \
        tar zxf git-2.14.4.tar.gz && \
        cd git-2.14.4 && \
        make configure && \
        ./configure --prefix=/usr && \
        make all doc info && \
        make install install-doc install-html install-info