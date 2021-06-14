FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

RUN apt-get update ; \
    apt-get install -y php7.3-fpm; \
    apt-get install -y php7.3-mysql; \
    # apt-get install php-cgi; \
    # apt-get install php-cli; \
    # apt-get install php-fpm; \
    # apt-get install php-json; \
    # apt-get install php-pdo ; \
    # apt-get install php-mysql; \
    # apt-get install php-zip; \
    # apt-get install php-gd; \
    # apt-get install php-mbstring; \
    # apt-get install php-curl; \
    # apt-get install php-xml; \
    # apt-get install php-pear; \
    # apt-get install php-bcmath; \
    apt-get install -y curl

EXPOSE 9000

RUN mkdir -p var/www/html

COPY /tools/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir -p /run/php

# #wordpress
# RUN curl -LO https://wordpress.org/latest.tar.gz; \
#     tar xvf latest.tar.gz; \
#     rm -f latest.tar.gz; \
#     mv wordpress var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY /tools/wp-config.php var/www/html/
# COPY /tools/index.php var/www/html/


CMD ["php-fpm7.3", "-F"]


