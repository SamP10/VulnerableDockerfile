FROM mariadb

ENV MYSQL_ROOT_PASSWORD tiaspbiqe2r
ENV MYSQL_DATABASE university
RUN

COPY ./uni.sql /docker-entrypoint-initdb.d/