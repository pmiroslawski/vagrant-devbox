#!/bin/bash

echo "---------------------------------------"
echo "> MONGO DB SERVER"
echo "---------------------------------------"

if [ ! -f /etc/init.d/mongodb ]; 
then
  apt-get install -y mongodb-server
else
  apt-get install -y --only-upgrade mongodb-server 
fi

