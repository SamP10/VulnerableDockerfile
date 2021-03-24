FROM mariadb:latest
ENV MYSQL_ROOT_PASSWORD tiaspbiqe2r
ENV MYSQL_DATABASE university
COPY ./uni.sql /tmp/
RUN mysql -uroot -ptiaspbiqe2r university < /tmp/uni.sql
