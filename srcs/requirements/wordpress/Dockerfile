FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

RUN apt-get update ; \
    apt-get install -y php7.3-fpm; \
    apt-get install -y php7.3-mysql; \
    apt-get install -y php7-phar; \
    apt-get install -y curl; \
    mkdir -p var/www/html; \
    mkdir -p /run/php

COPY /tools/www.conf /etc/php/7.3/fpm/pool.d
COPY /tools/wp-config.php ./
COPY /tools/start_wp.sh ./

EXPOSE 9000

CMD ["sh", "start_wp.sh"]
