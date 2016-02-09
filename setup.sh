#!/bin/bash
set -e

# Setup project symlinks.
#ln -s /var/www/project/repo/web /var/www/current
#ln -s /var/www/current /var/www/html
#chown -R ubuntu:www-data /var/www/html

exec "$@"
