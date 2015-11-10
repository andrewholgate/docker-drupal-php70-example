FROM andrewholgate/drupal-php55-dev:latest
MAINTAINER Andrew Holgate <andrewholgate@yahoo.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Project specific PHP dependencies.
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-mcrypt php5-ldap
# Install Twig C library for Drupal 8.
RUN wget https://github.com/twigphp/Twig/archive/v1.23.1.tar.gz && \
    tar zxvf v1.23.1.tar.gz && \
    rm v1.23.1.tar.gz && \
    cd Twig-1.23.1/ext/twig/ && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    echo "extension=twig.so" >> /etc/php5/fpm/conf.d/20-twig.ini

# Copy over project specific setup script
COPY setup.sh /usr/local/bin/setup
RUN chmod +x /usr/local/bin/setup

# Clean-up installation.
RUN DEBIAN_FRONTEND=noninteractive apt-get autoclean && apt-get autoremove

RUN /etc/init.d/apache2 restart

ENTRYPOINT ["/usr/local/bin/setup"]
CMD ["/usr/local/bin/run"]
