#!/bin/bash

mkdir -m 777 /var/run/mysqld

sh config_db.sh
cat config_db.sql
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# service mysql start
# mysqld mysql < config_db.sql
# service mysql stop

exec mysqld --init-file=/config_db.sql
