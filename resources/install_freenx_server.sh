#!/bin/bash -e

# Reference: 
# https://help.ubuntu.com/community/FreeNX

sudo apt-add-repository -y ppa:freenx-team/trusty
sudo apt-get update -y
sudo apt-get install -y freenx-server

tar -xvf /tmp/nxsetup.tar.gz
sudo cp ./nxsetup /usr/lib/nx/nxsetup

# setup NX using default settings
#
# Produces public/private dsa key pair artifacts at:
# - /etc/nxserver/users.id_dsa
# - /etc/nxserver/users.id_dsa.pub
sudo /usr/lib/nx/nxsetup --install --setup-nomachine-key

echo "Save this private key to your local machine:"
sudo cat /etc/nxserver/users.id_dsa

# Allow NX via SSH for default user ubuntu
if ! grep "AllowUsers ubuntu nx" /etc/ssh/sshd_config; then
	sudo sh -c 'echo "AllowUsers ubuntu nx" >> /etc/ssh/sshd_config'
fi
sudo ssh-keygen -A
/etc/init.d/ssh restart

# Restart NX server
sudo /etc/init.d/freenx-server restart
