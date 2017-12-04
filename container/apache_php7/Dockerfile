FROM php:7.1-apache
# https://github.com/docker-library/php/blob/f795769559d9ce740e57ebd32f60f8a4569ee5b6/7.2/stretch/apache/Dockerfile

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
  && apt-get install -y less vim wget unzip rsync git mysql-client \
  && wget https://www.dotdeb.org/dotdeb.gpg \
  && apt-key add dotdeb.gpg \
  && apt-get update \
  && apt-get install -y libfreetype6 libjpeg62-turbo libpng12-dev libjpeg-dev libxml2-dev libwebp5 libxpm4 php-mysql php-gd php-zip php-soap php-bcmath \
  && docker-php-ext-configure gd --with-jpeg-dir=/usr/local/ \
  && docker-php-ext-install gd zip bcmath soap pdo_mysql \
  && apt-get clean \
  && echo "export TERM=xterm" >> /root/.bashrc \
  && apt-get autoremove -y


# Install Xdebug
RUN curl -fsSL 'https://xdebug.org/files/xdebug-2.4.0.tgz' -o xdebug.tar.gz \
    && mkdir -p xdebug \
    && tar -xf xdebug.tar.gz -C xdebug --strip-components=1 \
    && rm xdebug.tar.gz \
    && ( \
    cd xdebug \
    && phpize \
    && ./configure --enable-xdebug \
    && make -j$(nproc) \
    && make install \
    ) \
    && rm -r xdebug \
    && docker-php-ext-enable xdebug

# composer stuff
RUN php -r 'readfile("https://getcomposer.org/installer");' > composer-setup.php \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  && rm -f composer-setup.php \
  && chown www-data:www-data /var/www

# prepare entrypoint.d pattern
RUN mkdir /entrypoint.d
COPY ./files/entrypoint.sh /entrypoint.sh
COPY ./entrypoint.d/* /entrypoint.d/
RUN chmod 777 /entrypoint.sh \
  && chmod 777 /entrypoint.d/*

# apache stuff
RUN /usr/sbin/a2enmod rewrite && /usr/sbin/a2enmod headers && /usr/sbin/a2enmod expires
COPY ./files/000-default.conf /etc/apache2/sites-available/000-default.conf

# oxid stuff
COPY ./files/config.inc.php /var/www/config.inc.php

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
