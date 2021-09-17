#!/bin/sh
set -e

if [ ! -f /var/www/html/config/config.yml ]; then

    # default env
    : ${SITE_TITLE="Pico"}
    : ${PICO_DEBUG="~"}

    echo
    echo "---- /var/www/html/config/config.yml ------------------------"
    cat /var/www/html/config/config.yml.template \
       | sed "s/site_title: Pico/site_title: ${SITE_TITLE}/g" \
       | sed "s/debug: ~/debug: ${PICO_DEBUG}/g" \
       | tee /var/www/html/config/config.yml
    echo "-------------------------------------------------------------"
    echo
fi

exec httpd -f /etc/httpd/conf/httpd.conf -DFOREGROUND
