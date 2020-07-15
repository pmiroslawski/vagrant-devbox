#!/bin/bash

echo "---------------------------------------"
echo "> PHPMD"
echo "---------------------------------------"

if [ ! -f /usr/bin/phpmd  ]; 
then
  cd ~/
  wget -c https://phpmd.org/static/latest/phpmd.phar
  sudo mv phpmd.phar /usr/bin/phpmd
  sudo chmod 755 /usr/bin/phpmd
else 
  echo "phpmd installed!"
fi

