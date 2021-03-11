FROM ubuntu:latest

#Update and Upgrade apk
RUN apt-get update && apt-get upgrade -y

#Environment setup
ENV DEBIAN_FRONTEND="noninteractive"

#Install Apache, MySQL and PHP
RUN  apt-get install -y apache2
RUN apt-get install -y php libapache2-mod-php php-mysql php-curl php-dev php-json php-common php-cli
RUN apt-get install -y mysql-server

#Install GIT for website
RUN apt-get install -y git
RUN git clone https://github.com/SamP10/UniVulnerableWebsite.git


EXPOSE 80 8080