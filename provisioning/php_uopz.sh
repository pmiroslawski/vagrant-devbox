#!/bin/bash

echo "---------------------------------------"
echo "> PHP - UOPZ"
echo "---------------------------------------"

if [[ $(php -m | grep uopz) = 'uopz' ]];
then
    echo "UOPZ already installed" 
else
    cd ~/ && git clone https://github.com/krakjoe/uopz
    cd uopz && phpize && ./configure && make && make install
    cd ~/ && rm uopz -Rf
    echo 'extension=uopz.so' > /etc/php/$PHP/mods-available/uopz.ini
    ln -s /etc/php/$PHP/mods-available/uopz.ini /etc/php/$PHP/cli/conf.d/05-uopz.ini
    ln -s /etc/php/$PHP/mods-available/uopz.ini /etc/php/$PHP/phpdbg/conf.d/05-uopz.ini
fi 

