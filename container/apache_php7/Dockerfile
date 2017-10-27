FROM php:7.1-apache

MAINTAINER module@proudcommerce.com

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_CODENAME jessie

# timezone / date   
RUN echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# install packages
RUN apt-get update \
  && echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
  && echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
  && apt-get install -y less vim wget unzip rsync git postfix mysql-client \
  && wget https://www.dotdeb.org/dotdeb.gpg \
  && apt-key add dotdeb.gpg \
  && apt-get update \
  && apt-get install -y libfreetype6 libjpeg62-turbo libpng12-dev libjpeg-dev libwebp5 libxpm4 php7.0-mysql php7.0-gd \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-configure gd --with-jpeg-dir=/usr/local/ \
  && docker-php-ext-install gd \
  && apt-get clean \
  && echo "export TERM=xterm" >> /root/.bashrc \
  && apt-get autoremove -y

# composer stuff
RUN php -r 'readfile("https://getcomposer.org/installer");' > composer-setup.php \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  && rm -f composer-setup.php \
  && chown www-data:www-data /var/www

# prepare entrypoint.d pattern
RUN mkdir /entrypoint.d
COPY ./files/entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
COPY ./entrypoint.d/* /entrypoint.d/
RUN chmod 777 /entrypoint.d/*

# apache stuff
RUN /usr/sbin/a2enmod rewrite && /usr/sbin/a2enmod headers && /usr/sbin/a2enmod expires
COPY ./files/000-default.conf /etc/apache2/sites-available/000-default.conf

# oxid stuff
COPY ./files/config.inc.php /var/www/config.inc.php

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]