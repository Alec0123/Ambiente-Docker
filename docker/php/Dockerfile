FROM php:7.3-fpm

COPY php.ini /usr/local/etc/php/php.ini

#Mcrypt
RUN apt-get update && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt 

#Biblioteca    
RUN apt install -y libssl-dev  
RUN apt-get update -y && apt-get install -y sendmail libpng-dev

#Extensões 
RUN docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    apt-get install -y libxml2-dev && \
    docker-php-ext-install fileinfo && \
    docker-php-ext-install gettext && \
    docker-php-ext-install mbstring &&\
    docker-php-ext-install exif && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install sockets && \
    docker-php-ext-install xmlrpc && \
    docker-php-ext-install soap 

#Curl
RUN apt-get update -y && apt-get install -y curl && apt-get clean -y

#Imap
RUN apt-get update && \
    apt-get install -y \
        libc-client-dev libkrb5-dev && \
    rm -r /var/lib/apt/lists/*
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install -j$(nproc) imap






