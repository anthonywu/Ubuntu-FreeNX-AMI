#!/bin/bash -e

sudo apt-get update -y

if [ "$DESKTOP_FLAVOR" = "standard" ]; then
	sudo apt-get install -y ubuntu-desktop
elif [ "$DESKTOP_FLAVOR" = "lite" ]; then
	sudo apt-get install -y --without-recommends ubuntu-desktop	
elif [ "$DESKTOP_FLAVOR" = "lxde" ]; then
	sudo apt-get install -y lubuntu-desktop
elif [ "$DESKTOP_FLAVOR" = "kde" ]; then
	sudo apt-get install -y kubuntu-desktop
elif [ "$DESKTOP_FLAVOR" = "xfce" ]; then
	sudo apt-get install -y xubuntu-desktop
fi

# Common GUI tools
sudo apt-get install -y emacs24 gufw
