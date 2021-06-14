#!/bin/bash

curl -LO https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php


mv adminer-4.8.1.php var/www/html/Adminer/adminer.php

chown -R www-data:www-data /var/www/html/Adminer/adminer.php
chmod 755 /var/www/html/Adminer/adminer.php

# CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]