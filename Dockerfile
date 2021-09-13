From library/centos:7

ARG PICO_VERSION="2.1.4"

RUN yum install -y httpd php php-xml php-mbstring php-pear
COPY ./httpd.conf /etc/httpd/conf/httpd.conf

ADD https://github.com/picocms/Pico/releases/download/v${PICO_VERSION}/pico-release-v${PICO_VERSION}.tar.gz /var/www/html/
WORKDIR /var/www/html/
RUN tar -xf pico-release-v$PICO_VERSION.tar.gz && rm pico-release-v$PICO_VERSION.tar.gz
COPY ./config.php /var/www/html/config/config.php
RUN chown -R apache:apache /var/www/html
RUN chown -R apache:apache /var/www/html/.htaccess

COPY docker-entrypoint.sh /
VOLUME /var/www/html/content
VOLUME /var/www/html/assets
VOLUME /var/www/html/themes
VOLUME /data

CMD ["/docker-entrypoint.sh"]
