#!/bin/bash

echo "---------------------------------------"
echo "> PHP $PHP - PECL SSH2 EXT"
echo "---------------------------------------"

if [ -x /usr/bin/pecl ];
then
    pecl channel-update pecl.php.net
    
    if php -m | grep ssh2; 
    then
	printf "\n updating ... \n" | pecl upgrade ssh2-1.1.2
    else
	apt-get install -y libssh2-1 libssh2-1-dev
  	printf "\n" | pecl install ssh2-1.1.2
  	echo "extension=ssh2.so" > /etc/php/$PHP/mods-available/ssh2.ini
  	ln -s /etc/php/$PHP/mods-available/ssh2.ini /etc/php/$PHP/cli/conf.d/20-ssh2.ini
  	ln -s /etc/php/$PHP/mods-available/ssh2.ini /etc/php/$PHP/apache2/conf.d/20-ssh2.ini
  	ln -s /etc/php/$PHP/mods-available/ssh2.ini /etc/php/$PHP/phpdbg/conf.d/20-ssh2.ini
  
  	echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
    fi
else
    echo "PECL has not been found.";
fi

