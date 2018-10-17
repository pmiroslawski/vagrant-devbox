#!/bin/bash

echo "---------------------------------------"
echo "> GIT"
echo "---------------------------------------"

if [ ! -f /usr/bin/git  ]; 
then
  apt-get install
else
  apt-get install -y --only-upgrade git 
  echo "GIT already installed"
fi

echo "---------------------------------------"
echo "> GIT FLOW"
echo "---------------------------------------"

if [[ $(dpkg -l | grep git-flow) = 'git-flow' ]];
then 
  apt-get install -y --only-upgrade git-flow 
  echo "GIT FLOW already installed"
else
  apt-get install -y git-flow
fi
