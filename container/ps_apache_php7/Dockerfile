FROM php:7.0-apache

MAINTAINER merkl@proudsourcing.de

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# timezone / date   
RUN echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# install packages
RUN apt-get update \
  && echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
  && echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
  && apt-get install -y less vim wget unzip rsync git postfix \
  && wget https://www.dotdeb.org/dotdeb.gpg \
  && apt-key add dotdeb.gpg \
  && apt-get update \
  && apt-get -y upgrade --fix-missing \
  && apt-get install -y libfreetype6 libjpeg62-turbo libpng12-dev libjpeg-dev libwebp5 libxpm4 php7.0-mysql php7.0-gd \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-configure gd --with-jpeg-dir=/usr/local/ \
  && docker-php-ext-install gd \
  && apt-get clean \
  && echo "export TERM=xterm" >> /root/.bashrc
  
# enable apache modules
RUN /usr/sbin/a2enmod rewrite && /usr/sbin/a2enmod headers && /usr/sbin/a2enmod expires

# use own vhost configuration
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

COPY ./ps_entrypoint.sh /
CMD ["/bin/sh", "/ps_entrypoint.sh"]