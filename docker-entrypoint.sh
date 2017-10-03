#!/bin/sh
set -e

chown apache:apache /var/www/html/content
chmod 755 /var/www/html/content
exec httpd -f /etc/httpd/conf/httpd.conf -DFOREGROUND
