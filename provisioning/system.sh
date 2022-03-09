#!/bin/bash

echo "---------------------------------------"
echo "> SYSTEM UPDATE"
echo "---------------------------------------"

apt-get install -y vim aptitude curl zsh net-tools htop mc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
