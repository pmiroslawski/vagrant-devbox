#!/bin/bash

echo "---------------------------------------"
echo "> COMPOSER"
echo "---------------------------------------"

if [ ! -f /usr/bin/composer  ]; 
then
  cd /home/dgvip/
  wget https://getcomposer.org/installer
  php installer
  sudo mv composer.phar /usr/bin/composer
  sudo chmod 777 /usr/bin/composer
  rm /home/dgvip/installer
else 
  echo "composer installed!"
fi

