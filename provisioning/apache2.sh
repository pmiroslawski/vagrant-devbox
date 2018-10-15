#!/bin/bash

echo "---------------------------------------"
echo "> APACHE2 "
echo "---------------------------------------"

packages="apache2"

if [ ! -f /etc/init.d/apache2 ]; 
then
  apt-get install -y $packages
  cd /etc/apache2/mods-available && sudo a2enmod ssl && sudo a2enmod headers && sudo a2enmod rewrite
  
  mkdir /etc/apache2/ssl
  
  echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
else
  apt-get install -y  $packages 
fi


/etc/init.d/apache2 restart
