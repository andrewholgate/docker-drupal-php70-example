#!/bin/bash

# Project variables.
URL=example.drupalproject.com
CONTAINER_NAME=dockerdrupalprojectexample_drupalexampleweb_1

# DO NOT EDIT BELOW

# Remove IP address entry for the host name.
sudo sed -i_bak -e "/$URL/d" /etc/hosts

# Add IP address to hosts file.
sudo bash -c "echo $(sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' \
$CONTAINER_NAME) $URL >> /etc/hosts"

echo Opening with: xdg-open http://$URL
