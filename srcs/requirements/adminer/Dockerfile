FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

RUN apt-get update ; \
    apt-get install -y curl

COPY /tools/adminer.sh ./

RUN mkdir -p /var/www/html/Adminer

RUN bash /adminer.sh


CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]

# CMD sh adminer.sh

