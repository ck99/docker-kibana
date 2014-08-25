#! /bin/sh
#exec /sbin/setuser www-data /usr/sbin/apachectl -DFOREGROUND >>/var/log/apache2.log 2>&1
exec /usr/sbin/apachectl -DFOREGROUND >>/var/log/apache2.log 2>&1

