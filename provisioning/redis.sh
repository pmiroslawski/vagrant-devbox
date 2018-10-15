#!/bin/bash

echo "---------------------------------------"
echo "> REDIS SERVER"
echo "---------------------------------------"

if [ ! -f /etc/init.d/redis-server ]; 
then
  apt-get install -y redis-server
else
  apt-get install -y --only-upgrade redis-server 
fi

