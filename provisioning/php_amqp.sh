#!/bin/bash

echo "---------------------------------------"
echo "> PHP $PHP - PECL AMQP EXT"
echo "---------------------------------------"

if [ -x /usr/bin/pecl ];
then
    pecl channel-update pecl.php.net
    
    if php -m | grep "amqp"; 
    then
	printf "\n updating ... \n" | pecl upgrade amqp
    else
    apt install -y librabbitmq-dev
	printf "\n installing ... \n" | pecl install amqp
  	echo "extension=amqp.so" > /etc/php/$PHP/mods-available/amqp.ini
  	ln -s /etc/php/$PHP/mods-available/amqp.ini /etc/php/$PHP/cli/conf.d/20-amqp.ini
  	ln -s /etc/php/$PHP/mods-available/amqp.ini /etc/php/$PHP/apache2/conf.d/20-amqp.ini
  	ln -s /etc/php/$PHP/mods-available/amqp.ini /etc/php/$PHP/phpdbg/conf.d/20-amqp.ini

  	echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
    fi
else
    echo "PECL has not been found.";
fi

