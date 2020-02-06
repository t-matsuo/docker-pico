#!/bin/sh
set -e

exec httpd -f /etc/httpd/conf/httpd.conf -DFOREGROUND
