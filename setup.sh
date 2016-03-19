#!/bin/bash
set -e

## Setup project symlinks.
#sudo rm -Rf /var/www/html
#sudo ln -s /var/www/project/repo/web /var/www/current
#sudo ln -s /var/www/current /var/www/html
#sudo chown -R ubuntu:www-data /var/www/html /var/www/current

## Add SSH keys to SSH agent
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa

## Change permissions to config and SSH key as needed.
#chown ubuntu:ubuntu ~/.ssh/config

# Add git user configs
#git config --global user.email "name@example.com"
#git config --global user.name "Name Surname"

exec "$@"
