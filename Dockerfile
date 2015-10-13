FROM andrewholgate/drupal-php55-dev:latest
MAINTAINER Andrew Holgate <andrewholgate@yahoo.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Project specific PHP dependencies.
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-mcrypt php5-ldap

# Copy over project specific setup script
COPY setup.sh /usr/local/bin/setup
RUN chmod +x /usr/local/bin/setup

# Clean-up installation.
RUN DEBIAN_FRONTEND=noninteractive apt-get autoclean && apt-get autoremove

RUN /etc/init.d/apache2 restart

ENTRYPOINT ["/usr/local/bin/setup"]
CMD ["/usr/local/bin/run"]
