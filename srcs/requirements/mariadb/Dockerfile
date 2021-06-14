FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD

RUN apt-get update && \
apt-get install -y mariadb-server mariadb-common mariadb-client


# COPY /tools/init.sql ./
COPY /tools/config_db.sh ./

COPY /tools/50-server.cnf /etc/mysql/mariadb.conf.d/
# # COPY /tools/my.cnf /etc/mysql/
COPY /tools/run.sh ./
# RUN bash /config_db.sh

# RUN cat config_db.sql

# RUN service mysql start && mysql < config_db.sql

# RUN mysql_install_db --user=mysql
EXPOSE 3306

CMD ["sh", "run.sh"]
# CMD ["mysqld"]

# RUN mysqld --user=mysql --datadir=/data --init-file=/create.sql


# CREATE DATABASE %MYSQL_DATABASE%;
# CREATE USER '%MYSQL_USER%'@localhost IDENTIFIED BY '%MYSQL_PASSWORD%';
# GRANT ALL PRIVILEGES ON %MYSQL_DATABASE%.* TO '%MYSQL_USER%'@'localhost';
# FLUSH PRIVILEGES;

# CREATE DATABASE wordpress;
# CREATE USER 'ayzapata'@localhost IDENTIFIED BY '12345';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'ayzapata'@'localhost';
# FLUSH PRIVILEGES;

# CREATE DATABASE $MYSQL_DATABASE;
# CREATE USER '$MYSQL_USER'@localhost IDENTIFIED BY '$MYSQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';
# FLUSH PRIVILEGES;