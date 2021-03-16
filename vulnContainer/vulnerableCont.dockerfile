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

#GIT Vulnerability CVE https://www.cvedetails.com/cve/CVE-2018-17456/
RUN curl -LO https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz
RUN tar zxf git-2.14.4.tar.gz
RUN cd git-2.14.4 && \
    make configure && \
    ./configure --prefix=/usr/local && \
    make prefix=/usr/local install

#Samba Vulnerability CVE https://www.cvedetails.com/cve/CVE-2017-7494/
RUN curl -LO https://mirrors.dotsrc.org/samba/samba-4.2.14.tar.gz
RUN tar -xvf samba-4.2.14.tar.gz
RUN cd samba-4.2.14 && \
    make configure && \
    ./configure && \
    make install