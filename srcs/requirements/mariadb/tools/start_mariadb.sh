#!/bin/bash
mkdir -m 777 /var/run/mysqld
sh config_db.sh
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
exec mysqld --init-file=/config_db.sql
