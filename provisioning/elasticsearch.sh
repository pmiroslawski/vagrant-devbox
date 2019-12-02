#!/bin/bash

echo "---------------------------------------"
echo "> ELASTICSEARCH"
echo "---------------------------------------"

if [ ! -f /usr/share/elasticsearch/bin/elasticsearch ]; 
then
  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
  sudo apt-get install apt-transport-https
  echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
  sudo apt-get update && sudo apt-get install elasticsearch
else
  sudo apt-get install -y --only-upgrade elasticsearch 
  echo " ELASTICSEARCH already installed"
fi

systemctl restart elasticsearch
