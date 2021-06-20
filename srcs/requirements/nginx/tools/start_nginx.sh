# /bin/bash

cp ./50x.html /var/www/html
echo "127.0.0.1  ayzapata.42.fr" >> /etc/hosts && nginx -g "daemon off;"