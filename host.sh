# Clean up previous IP address entry for the same host name.
sudo sed -i_bak -e '/example\.drupalproject\.com/d' /etc/hosts

# Add IP address to hosts file.
sudo bash -c "echo $(sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' \
dockerdrupalprojectexample_drupalexampleweb_1) \
example.drupalproject.com \
>> /etc/hosts"
