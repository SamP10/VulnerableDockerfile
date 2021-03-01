FROM alpine
#Update and Upgrade apk
RUN apk update && apk upgrade

#Install Apache, MySQL and PHP
RUN apk add apache2
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN apk add mariadb mariadb-client
RUN mariadb-secure-installation
RUN apk add openrc

#Install GIT for website
RUN apk add git
RUN cd /var/www/localhost/htdocs/
RUN git clone https://github.com/SamP10/UniVulnerableWebsite.git
EXPOSE 80 8080