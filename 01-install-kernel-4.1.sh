#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "Sorry, you are not root."
  exit 1
fi

apt-get update
apt-get install linux-image-4.1.0-rc6-bone5
reboot