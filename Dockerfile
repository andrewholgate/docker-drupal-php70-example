FROM andrewholgate/drupal-php70-dev:latest
MAINTAINER Andrew Holgate <andrewholgate@yahoo.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Project specific PHP dependencies.
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php7-mcrypt php7-ldap

# Copy over project specific setup script
COPY setup.sh /usr/local/bin/setup
RUN chmod +x /usr/local/bin/setup

# Clean-up installation.
RUN DEBIAN_FRONTEND=noninteractive apt-get -y autoclean && \
    DEBIAN_FRONTEND=noninteractive apt-get -y autoremove

RUN service apache2 restart
RUN service php7.0-fpm start

ENTRYPOINT ["/usr/local/bin/setup"]
CMD ["/usr/local/bin/run"]
