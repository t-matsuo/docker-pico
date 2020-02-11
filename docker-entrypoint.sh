#!/bin/sh
set -e

if [ -f /data/config.php ]; then
	cp /data/config.php /var/www/html/config/config.php
fi

exec httpd -f /etc/httpd/conf/httpd.conf -DFOREGROUND
