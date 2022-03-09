#!/bin/bash

echo "---------------------------------------"
echo "> PHP $PHP"
echo "---------------------------------------"

packages="libapache2-mod-php$PHP php$PHP-amqp php$PHP-bcmath php$PHP php$PHP-cli php$PHP-common php$PHP-curl php$PHP-dev php$PHP-fpm php$PHP-gd php$PHP-intl php$PHP-mbstring php$PHP-mysql php$PHP-opcache php$PHP-phpdbg php$PHP-pdo-mysql php$PHP-readline php$PHP-redis php$PHP-simplexml php$PHP-soap php-ssh2 php$PHP-sqlite3 php$PHP-tidy php$PHP-xml php$PHP-xsl php$PHP-zip"

if [ ! -f /usr/bin/php$PHP ];
then
  apt install software-properties-common -y
  add-apt-repository ppa:ondrej/php << EOF
2
EOF

  apt update

  if apt-get install -y $packages; then
    echo " PHP $PHP HAS BEEN INSTALLED SUCCESSFULLY!"
  fi
else
  apt-get install -y  $packages 
fi

update-alternatives --set php /usr/bin/php$PHP
