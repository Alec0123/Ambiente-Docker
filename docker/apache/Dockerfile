FROM httpd:2.4-alpine

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

COPY proxy.conf /usr/local/apache2/conf/proxy.conf
RUN echo "Include /usr/local/apache2/conf/proxy.conf" \
    >> /usr/local/apache2/conf/httpd.conf