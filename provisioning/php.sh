#!/bin/bash

echo "---------------------------------------"
echo "> PHP $PHP"
echo "---------------------------------------"

apt install software-properties-common -y
add-apt-repository ppa:ondrej/php
apt update

packages="libapache2-mod-php$PHP php$PHP-bcmath php$PHP php$PHP-cli php$PHP-common php$PHP-curl php$PHP-dev php$PHP-fpm php$PHP-gd php$PHP-intl php$PHP-json php$PHP-mbstring php$PHP-mysql php$PHP-opcache php$PHP-phpdbg php$PHP-pdo-mysql php$PHP-readline php$PHP-redis php$PHP-simplexml php$PHP-soap php$PHP-ssh2 php$PHP-sqlite3 php$PHP-tidy php$PHP-xml php$PHP-xsl php$PHP-zip"

if [ ! -f /usr/bin/php ]; 
then
  apt-get install -y $packages
  
  echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
else
  apt-get install -y  $packages 
fi

update-alternatives --set php /usr/bin/php$PHP
