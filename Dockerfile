From library/centos:7

ARG PICO_VERSION="2.1.4"

RUN yum install -y httpd php php-xml php-mbstring php-pear

COPY --chown=apache:apache ./httpd.conf /etc/httpd/conf/httpd.conf
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/httpd
ADD https://github.com/picocms/Pico/releases/download/v${PICO_VERSION}/pico-release-v${PICO_VERSION}.tar.gz /var/www/html/
WORKDIR /var/www/html/
RUN tar -xf pico-release-v$PICO_VERSION.tar.gz && rm pico-release-v$PICO_VERSION.tar.gz
COPY ./config.php /var/www/html/config/config.php
RUN chown -R apache:apache /var/www/html
RUN chown -R apache:apache /var/www/html/.htaccess
RUN chown -R apache:apache /etc/httpd
RUN chmod -R a+rw /etc/httpd
RUN chmod a+rwx /run/httpd
RUN chmod a+rwx /run/httpd/htcacheclean

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]

USER apache
