From library/centos:7

RUN yum install -y httpd php php-xml php-mbstring php-pear
COPY ./httpd.conf /etc/httpd/conf/httpd.conf

ADD pico-release-v1.0.6.tar.gz /var/www/html/
COPY ./config.php /var/www/html/config/config.php
RUN chown -R apache:apache /var/www/html
RUN chown -R apache:apache /var/www/html/.htaccess

RUN mkdir /var/www/html/content && chown apache:apache /var/www/html/content && chmod 777 /var/www/html/content
COPY docker-entrypoint.sh /
VOLUME /var/www/html/content

CMD ["/docker-entrypoint.sh"]
