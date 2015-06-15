# Linux CAN Installer (for BeagleBone)

Installing CAN utilities and enabling using CAN Capes.

NOTE: ALL SCRIPTS MUST BE EXECUTED AS ROOT (sudo SCRIPT) AND NEED INTERNET TO WORK!

Installing SocketCAN tools and libsocketcan on your BeagleBone (reboot after each step):
1. First update your kernel to 4.1, which supports capes and CAN. You can use other kernels too, like 3.14, but probably it will not support capes. For that use ```01-install-kernel.sh```
2. Use ```02-install-dtc-overlays.sh``` to install device tree overlays for BBB (src: https://github.com/beagleboard/bb.org-overlays)
3. Install the can-utils and the libsocketcan running ```03-install-utils.sh```

Using those 3 steps you be ready to use CAN on your BeagleBone. To enable it, I did a default script for activation, which you can modify with your configurations. You just have to run ```04-activate.sh $bitrate``` and pass bitrate as argument (by default is 1000000).

# CBB-Serial cape observations:
If you use the CBB cape, don't forget to plug an external 5V font because without that the CAN transceiver don't work. I spent a week until a discover that, so don't make the same mistake.

Other thing is that you will not need GND to make your communications work, as some uses. You just need CANH and CANL pins.