#!/bin/bash -eu

/root/bin/remountfs_rw

echo "On RikStation, remove authorized_keys from root and teslapi now, then press return..."
read

echo "Setting new pi@ password..."
passwd pi

echo "Setting up root SSH..."
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa
ssh-copy-id teslapi@seattle.rik.systems

echo "Setting up pi SSH..."
sudo -u pi ssh-keygen -t rsa -N '' -f /home/pi/.ssh/id_rsa
sudo -u pi ssh-copy-id teslapi@seattle.rik.systems

echo "Setting up reverse SSH"
sudo -u pi sh -c 'ssh rik@seattle.rik.systems cat .ssh/id_rsa.pub > /home/pi/.ssh/authorized_keys'