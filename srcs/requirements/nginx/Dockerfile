FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

RUN apt-get update ; \
    apt-get install -y nginx openssl ; \
    #ssl
    mkdir -p /etc/nginx/ssl ; \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 \
        -nodes -out /etc/nginx/ssl/localhost.crt \
        -keyout /etc/nginx/ssl/localhost.key \ 
        -subj "/C=FR/ST=Paris/L=Ile-de-France/O=42 School/OU=ayzapata/CN=ayzapata.42.fr"



#nginx
RUN rm -f /etc/nginx/sites-enabled/default ; \
    rm -f /etc/nginx/sites-available/default

COPY /tools/config/mynginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

RUN mkdir -p /var/www/html/Adminer
# RUN mkdir -p /var/www/
COPY /tools/html/50x.html /var/www/html
COPY /tools/html/index.html /var/www/html
EXPOSE 443

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# RUN rm -f /etc/hosts
# RUN chmod 755 /etc/hosts

# RUN echo "127.0.0.1  ayzapata.42.fr" >> /etc/hosts

COPY /tools/daemon.sh ./

CMD ["sh", "daemon.sh"]

#CMD ["nginx", "-g", "daemon off;"]
