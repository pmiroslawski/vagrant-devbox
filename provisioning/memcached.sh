#!/bin/bash

echo "---------------------------------------"
echo "> MEMCACHED SERVER"
echo "---------------------------------------"

if [ ! -f /etc/init.d/memcached ]; 
then
  apt-get install -y memcached
else
  apt-get install -y --only-upgrade memcached 
fi

