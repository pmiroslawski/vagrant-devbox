#!/bin/bash

echo "---------------------------------------"
echo "> MONGODB SERVER"
echo "---------------------------------------"

if [ ! -f /etc/init.d/mongodb ]; 
then
  wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
  echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
  sudo apt-get update && sudo apt-get install -y mongodb-org
else
  sudo apt-get install -y --only-upgrade mongodb-org
  echo " MONGODB already installed"
fi

