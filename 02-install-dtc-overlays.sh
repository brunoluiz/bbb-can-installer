#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "Sorry, you are not root."
  exit 1
fi

mkdir tmp
cd tmp

pkgname=bb.org-overlays
if [ ! -d $pkgname ]; then
then
  echo "$pkgname folder does not exist... Downloading!"
  git clone https://github.com/beagleboard/bb.org-overlays
fi

cd $pkgname
./dtc-overlay.sh
./install.sh

reboot