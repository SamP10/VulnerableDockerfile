FROM mariadb

ENV MYSQL_ROOT_PASSWORD tiaspbiqe2r
ENV MYSQL_DATABASE university
COPY ./uni.sql /
RUN mysql -u root -p tiaspbiqe2r && \
    CREATE DATABASE university
RUN mysql -u root -p tiaspbiqe2r university < uni.sql