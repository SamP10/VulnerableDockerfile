FROM ubuntu:bionic-20180426

ENV DEBIAN_FRONTEND="noninteractive"

#Install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential && \
#Curl Vulnerability https://www.cvedetails.com/cve/CVE-2018-1000300/
    curl



#GIT Vulnerability CVE https://www.cvedetails.com/cve/CVE-2018-17456/
#RUN curl -LO https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz
#RUN tar zxf git-2.14.4.tar.gz
#RUN cd git-2.14.4 && \
#    make configure && \
#    ./configure --prefix=/usr/local && \
#    make prefix=/usr/local install
#RUN rm git-2.14.4.tar.gz
RUN apt-get install -y git

#Not correctly configure for ARM architecture
#LibreOffice Vulnerability CVE https://www.cvedetails.com/cve/CVE-2019-9851/
#RUN curl -LO https://downloadarchive.documentfoundation.org/libreoffice/old/6.2.3.1/deb/x86_64/LibreOffice_6.2.3.1_Linux_x86-64_deb.tar.gz
#RUN tar zxf LibreOffice_6.2.3.1_Linux_x86-64_deb.tar.gz
#RUN cd LibreOffice_6.2.3.1_Linux_x86-64_deb/DEBS/ && \
#    dpkg -i *.deb
#RUN rm LibreOffice_6.2.3.1_Linux_x86-64_deb.tar.gz

#Installation of ftp server
RUN apt-get install -y proftpd

#Rdesktop Vulnerability https://www.cvedetails.com/cve/CVE-2018-20182/
RUN apt-get install -y rdesktop

#OpenSSH Vulnerability https://www.cvedetails.com/cve/CVE-2018-15473/
RUN apt-get install -y openssh-server