#!/bin/bash

#wordpress
curl -LO https://wordpress.org/latest.tar.gz; \
tar xvf latest.tar.gz; \
rm -f latest.tar.gz; \
mv ./wordpress/* var/www/html/

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
mv ./wp-config.php /var/www/html/

curl -o /bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x /bin/wp

# setup users
wp core install --allow-root --url=https://$DOMAIN_NAME/ \
--title="Mi sitio Web: INCEPTION" \
--admin_user=$WORDPRESS_DB_USER \
--admin_password=$WORDPRESS_DB_PASSWORD \
--admin_email=$WORDPRESS_USER_EMAIL \
--path='/var/www/html'

wp user create --allow-root $WORDPRESS_DB_USER2 $WORDPRESS_USER2_EMAIL \
--user_pass=$WORDPRESS_USER2_PASSWORD2 \
--role=author \
--path='/var/www/html'

exec php-fpm7.3 -F