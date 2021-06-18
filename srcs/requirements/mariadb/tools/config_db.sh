# /bin/bash
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> config_db.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >>  config_db.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> config_db.sql
echo "FLUSH PRIVILEGES;" >> config_db.sql
