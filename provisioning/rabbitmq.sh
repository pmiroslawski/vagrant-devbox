#!/bin/bash

echo "---------------------------------------"
echo "> RABBIT MQ "
echo "---------------------------------------"

packages="rabbitmq-server"

if [ ! -f /etc/init.d/rabbitmq ]; 
then
  apt-get install -y $packages
  rabbitmq-plugins enable rabbitmq_management
  
  rabbitmqctl add_user admin admin
  rabbitmqctl set_user_tags admin administrator
  rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"

  echo " ... HAS BEEN INSTALLED SUCCESSFULLY!"
else
  apt-get install -y  $packages 
fi


/etc/init.d/rabbitmq-server restart
