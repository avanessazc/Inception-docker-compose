FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

RUN apt-get update ; \
    apt-get install -y nginx openssl ; \
    #ssl
    mkdir -p /etc/nginx/ssl ; \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 \
        -nodes -out /etc/nginx/ssl/localhost.crt \
        -keyout /etc/nginx/ssl/localhost.key \ 
        -subj "/C=FR/ST=Paris/L=Ile-de-France/O=42 School/OU=ayzapata/CN=ayzapata.42.fr"; \
    #nginx
    rm -f /etc/nginx/sites-enabled/default ; \
    rm -f /etc/nginx/sites-available/default

COPY /tools/config/mynginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost; \
    mkdir -p /var/www/html; \
    chown -R www-data:www-data /var/www/html; \
    chmod -R 755 /var/www/html

COPY /tools/html/50x.html ./
COPY /tools/start_nginx.sh ./

EXPOSE 443

CMD ["sh", "start_nginx.sh"]
