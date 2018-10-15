#!/bin/bash

echo "---------------------------------------"
echo "> GIT"
echo "---------------------------------------"

if [ ! -f /usr/bin/git  ]; 
then
  apt-get install -y git git-flow
else
  apt-get install -y --only-upgrade git 
fi

