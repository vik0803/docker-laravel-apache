FROM ubuntu:wily
MAINTAINER Leen <leen@leen.in>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update

RUN apt-get -y install \
    git \
    curl \
    php5 \
    php5-gd \
    php5-mysqlnd \
    php5-mcrypt \
    php5-json \
    php5-curl \
    apache2

RUN apt-get clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
RUN sed -i "s#/var/www/html#/var/www/html/public#g" /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite
RUN php5enmod mcrypt

RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

ADD run.sh /run.sh
RUN chmod 755 /run.sh

WORKDIR /app

ONBUILD ADD composer.json /app/composer.json
ONBUILD ADD composer.lock /app/composer.lock
ONBUILD composer install --no-dev
ONBUILD ADD . /app
ONBUILD chown www-data:www-data /app -R

EXPOSE 80

CMD ["/run.sh"]
