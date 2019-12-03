#!/bin/bash
    
PHP='7.4'
MARIADB_DEFAULT_PASSWD='pass'

apt-get update -y
apt-get upgrade -y

CONF_DIR='/tmp/provisioning'
. $CONF_DIR/system.sh
. $CONF_DIR/git.sh

. $CONF_DIR/apache2.sh

. $CONF_DIR/php.sh
. $CONF_DIR/php_redis.sh
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
. $CONF_DIR/rabbitmq.sh
. $CONF_DIR/elasticsearch.sh

