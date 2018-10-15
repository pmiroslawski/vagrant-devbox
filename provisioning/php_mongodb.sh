#!/bin/bash

echo "---------------------------------------"
echo "> PHP $PHP - PECL MONGODB EXT"
echo "---------------------------------------"

if [ -x /usr/bin/pecl ];
then
    pecl channel-update pecl.php.net
    
    if php -m | grep "mongodb"; 
    then
	printf "\n updating ... \n" | pecl upgrade mongodb
    else
  	printf "\n" | pecl install mongodb
  	echo "extension=mongodb.so" > /etc/php/$PHP/mods-available/mongodb.ini
  	ln -s /etc/php/$PHP/mods-available/mongodb.ini /etc/php/$PHP/cli/conf.d/20-mongodb.ini
  	ln -s /etc/php/$PHP/mods-available/mongodb.ini /etc/php/$PHP/apache2/conf.d/20-mongodb.ini
 	ln -s /etc/php/$PHP/mods-available/mongodb.ini /etc/php/$PHP/phpdbg/conf.d/20-mongodb.ini
  
  	echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
    fi
else
    echo "PECL has not been found.";
fi
