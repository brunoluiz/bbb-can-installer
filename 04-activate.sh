#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "Sorry, you are not root."
  exit 1
fi

bitrate=$1
if [ -z $bitrate ]; then
  bitrate=1000000
fi

# If you use some kind of device which needs custom modules, 
# don't forget to enable the module at the section below
modprobe can
modprobe can-dev
modprobe can-raw

# Setup and activate CAN
ifconfig can0 down
ip link set can0 up type can bitrate $bitrate triple-sampling on listen-only off loopback off restart-ms 10
ifconfig can0 up

# If it doesn't work with ifconfig and iproute above commands, try to use canconfig tool below:
# canconfig can0 stop
# canconfig can0 bitrate $bitrate ctrlmode triple-sampling on listen-only off loopback off restart-ms 10
# canconfig can0 start