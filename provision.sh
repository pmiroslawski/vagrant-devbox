#!/bin/bash
    
PHP='7.2'
MARIADB_VERSION='10.2'
MARIADB_DEFAULT_PASSWD='46f8463e9903fdb04d5c1c11f96ae278'

apt-get update -y
apt-get upgrade -y

. /vagrant/provisioning/git.sh

. /vagrant/provisioning/apache2.sh

. /vagrant/provisioning/php.sh
. /vagrant/provisioning/composer.sh
. /vagrant/provisioning/php_mongodb.sh
. /vagrant/provisioning/php_memcached.sh
. /vagrant/provisioning/php_apcu.sh
. /vagrant/provisioning/php_uopz.sh

/etc/init.d/apache2 restart

. /vagrant/provisioning/phpmd.sh
. /vagrant/provisioning/redis.sh
. /vagrant/provisioning/mongodb.sh
. /vagrant/provisioning/mariadb.sh


