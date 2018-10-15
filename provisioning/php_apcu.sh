#!/bin/bash

echo "---------------------------------------"
echo "> PHP $PHP - PECL APCU EXT"
echo "---------------------------------------"

if [ -x /usr/bin/pecl ];
then
    pecl channel-update pecl.php.net
    
    if php -m | grep "apcu"; 
    then
	printf "\n updating ... \n" | pecl upgrade apcu
    else
	printf "\n installing ... \n" | pecl install apcu
  	echo "extension=apcu.so" > /etc/php/$PHP/mods-available/apcu.ini
  	ln -s /etc/php/$PHP/mods-available/apcu.ini /etc/php/$PHP/cli/conf.d/10-apcu.ini
  	ln -s /etc/php/$PHP/mods-available/apcu.ini /etc/php/$PHP/apache2/conf.d/10-apcu.ini
  	ln -s /etc/php/$PHP/mods-available/apcu.ini /etc/php/$PHP/phpdbg/conf.d/10-apcu.ini

  	echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
    fi
else
    echo "PECL has not been found.";
fi

