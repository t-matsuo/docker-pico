From library/centos:7

RUN yum install -y httpd php php-xml php-mbstring php-pear

COPY --chown=apache:apache ./httpd.conf /etc/httpd/conf/httpd.conf
ADD https://github.com/picocms/Pico/releases/download/v2.1.4/pico-release-v2.1.4.tar.gz /var/www/html/
WORKDIR /var/www/html/
RUN tar -xf pico-release-v2.1.4.tar.gz && rm pico-release-v2.1.4.tar.gz

RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/httpd && \
    chown -R apache:apache /var/www/html && \
    chown -R apache:apache /var/www/html/.htaccess && \
    chown -R apache:apache /etc/httpd && \
    chmod -R a+rw /etc/httpd && \
    chmod a+rwx /var/www/html/config && \
    chmod a+rwx /run/httpd && \
    chmod a+rwx /run/httpd/htcacheclean

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]

USER apache
