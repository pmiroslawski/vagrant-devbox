#!/bin/bash

echo "---------------------------------------"
echo "> MARIA DB $MARIADB_VERSION"
echo "---------------------------------------"

if [ ! -f /etc/init.d/mysql ]; 
then
     apt-get install -y software-properties-common
     apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
     add-apt-repository "deb http://ftp.osuosl.org/pub/mariadb/repo/$MARIADB_VERSION/debian sid main"
     apt-get update 
     
     debconf-set-selections <<< "maria-db-$MARIADB_VERSION mysql-server/root_password password $MARIADB_DEFAULT_PASSWD"
     debconf-set-selections <<< "maria-db-$MARIADB_VERSION mysql-server/root_password_again password $MARIADB_DEFAULT_PASSWD"
     
     # -qq implies -y --force-yes
     apt-get install -qq mariadb-server-$MARIADB_VERSION
     
     mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql -p$MARIADB_DEFAULT_PASSWD
     
     # install mariadb plugin - handlersocket
     installed=`mysql -uroot -p$MARIADB_DEFAULT_PASSWD -e "SET @plugin := (SELECT COUNT(*) as NUM FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME = 'handlersocket' and PLUGIN_STATUS = 'ACTIVE'); SELECT @plugin as res;"`
     expected="res
1";
     if [ "$installed" = "$expected" ]; then
         echo 'Mysql "handlersocket" plugin is installed already.'
     else
     	mysql -uroot -p$MARIADB_DEFAULT_PASSWD -e "INSTALL PLUGIN handlersocket SONAME 'handlersocket.so';"
       `echo '[mysqld]
handlersocket_address="127.0.0.1"
handlersocket_port="9998"
handlersocket_port_wr="9999"
' >  /etc/mysql/conf.d/mysqld.cnf`
        service mariadb restart
     fi
  echo " ... MARIADB HAS BEEN INSTALLED SUCCESSFULLY!"
else
  apt-get install -y --only-upgrade mariadb-server-$MARIADB_VERSION 
fi

