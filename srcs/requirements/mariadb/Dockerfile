FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-common mariadb-client

COPY /tools/config_db.sh ./
COPY /tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY /tools/start_mariadb.sh ./

EXPOSE 3306

CMD ["sh", "start_mariadb.sh"]
