#!/bin/bash

echo "---------------------------------------"
echo "> PHP $PHP - PECL MEMCACHED EXT"
echo "---------------------------------------"

if [ -x /usr/bin/pecl ];
then
    pecl channel-update pecl.php.net
    
    if php -m | grep memcached; 
    then
	printf "\n updating ... \n" | pecl upgrade memcached
    else
	apt-get install -y pkg-config zlib1g zlib1g-dev libmemcached-dev
  	printf "\n" | pecl install memcached
  	echo "extension=memcached.so" > /etc/php/$PHP/mods-available/memcached.ini
  	ln -s /etc/php/$PHP/mods-available/memcached.ini /etc/php/$PHP/cli/conf.d/20-memcached.ini
  	ln -s /etc/php/$PHP/mods-available/memcached.ini /etc/php/$PHP/apache2/conf.d/20-memcached.ini
  	ln -s /etc/php/$PHP/mods-available/memcached.ini /etc/php/$PHP/phpdbg/conf.d/20-memcached.ini
  
  	echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
    fi
else
    echo "PECL has not been found.";
fi

