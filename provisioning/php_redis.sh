#!/bin/bash

echo "---------------------------------------"
echo "> PHP - REDIS"
echo "---------------------------------------"

if [[ $(php -m | grep uopz) = 'uopz' ]];
then
    echo "PHP REDIS module already installed" 
else
    cd ~/ && git clone https://github.com/phpredis/phpredis
    cd phpredis && phpize && ./configure
    make && make install
    cd ~/ && rm phpredis -Rf
    echo 'extension=redis.so' > /etc/php/$PHP/mods-available/redis.ini
    ln -s /etc/php/$PHP/mods-available/redis.ini /etc/php/$PHP/cli/conf.d/20-redis.ini
    ln -s /etc/php/$PHP/mods-available/redis.ini /etc/php/$PHP/apache2/conf.d/20-redis.ini
    ln -s /etc/php/$PHP/mods-available/redis.ini /etc/php/$PHP/phpdbg/conf.d/20-redis.ini
fi 

