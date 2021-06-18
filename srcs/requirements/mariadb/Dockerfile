FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-common mariadb-client

COPY /tools/config_db.sh ./
COPY /tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY /tools/start_mariadb.sh ./

EXPOSE 3306

CMD ["sh", "start_mariadb.sh"]
