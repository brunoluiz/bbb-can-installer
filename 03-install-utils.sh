#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "Sorry, you are not root."
  exit 1
fi

mkdir tmp
cd tmp

# Install LibSocketCAN ############

# pkgname=libsocketcan-0.0.10
# if [ ! -d $pkgname ]; then
# then
#   echo "$pkgname folder does not exist... Downloading!"
#   wget http://www.pengutronix.de/software/libsocketcan/download/$pkgname.tar.bz2
#   tar xvjf $pkgname.tar.bz2
# fi

# cd $pkgname
# ./autogen.sh
# ./configure --prefix=/usr
# make
# make install

# # Install CAN-Utils ##############

# pkgname=canutils-4.0.6
# if [ ! -d $pkgname ]; then
# then
#   echo "$pkgname folder does not exist... Downloading!"
#   wget http://pengutronix.de/software/socket-can/download/canutils/v4.0/$pkgname.tar.bz2
#   tar xvjf $pkgname.tar.bz2
# fi

# cd $pkgname
# ./autogen.sh
# ./configure --prefix=/usr
# make
# make install

git clone https://github.com/linux-can/can-utils
cd can-utils
./autogen.sh
./configure --prefix=/usr
make
make install
