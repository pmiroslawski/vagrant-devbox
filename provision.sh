#!/bin/bash
    
PHP='7.2'
MARIADB_VERSION='10.2'
MARIADB_DEFAULT_PASSWD='46f8463e9903fdb04d5c1c11f96ae278'

apt-get update -y
apt-get upgrade -y

CONF_DIR='/tmp/provisioning'

. $CONF_DIR/git.sh

. $CONF_DIR/apache2.sh

. $CONF_DIR/php.sh
. $CONF_DIR/composer.sh
. $CONF_DIR/php_mongodb.sh
. $CONF_DIR/php_memcached.sh
. $CONF_DIR/php_apcu.sh
. $CONF_DIR/php_uopz.sh

/etc/init.d/apache2 restart

. $CONF_DIR/phpmd.sh
. $CONF_DIR/redis.sh
. $CONF_DIR/memcached.sh
. $CONF_DIR/mongodb.sh
. $CONF_DIR/mariadb.sh


