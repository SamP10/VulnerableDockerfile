FROM alpine
#Update and Upgrade apt
RUN apk update && apk upgrade
#Install Apache, MySQL and PHP
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN apk add mariadb mariadb-client

#Install GIT for website
RUN apk add git
RUN mkdir webdocs
RUN cd webdocs
RUN git clone https://github.com/SamP10/UniVulnerableWebsite.git
RUN systemctl restart apache2
EXPOSE 80 8080