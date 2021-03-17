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
RUN rm git-2.14.4.tar.gz

#LibreOffice Vulnerability CVE https://www.cvedetails.com/cve/CVE-2019-9851/
RUN curl -LO https://downloadarchive.documentfoundation.org/libreoffice/old/6.2.3.1/deb/x86_64/LibreOffice_6.2.3.1_Linux_x86-64_deb.tar.gz
RUN tar zxf LibreOffice_6.2.3.1_Linux_x86-64_deb.tar.gz
RUN cd LibreOffice_6.2.3.1_Linux_x86-64_deb/DEBS/ && \
    dpkg -i *.deb
RUN rm LibreOffice_6.2.3.1_Linux_x86-64_deb.tar.gz

#ProFTPd Vulnerability CVE https://www.cvedetails.com/cve/CVE-2019-12815/
RUN curl -LO https://github.com/proftpd/proftpd/archive/v1.3.5b.tar.gz
RUN tar zxf v1.3.5b.tar.gz
RUN cd proftpd-1.3.5b && \
    ./configure --prefix=/usr/local && \
    make install
RUN rm v1.3.5b.tar.gz

#Samba Vulnerability CVE https://www.cvedetails.com/cve/CVE-2017-7494/
#RUN curl -LO https://mirrors.dotsrc.org/samba/samba-4.2.14.tar.gz
#RUN tar -xvf samba-4.2.14.tar.gz
#RUN cd samba-4.2.14 && \
    #./configure && \
    #make install

