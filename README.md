# Linux CAN Installer (for BeagleBone)

NOTE: ALL SCRIPTS MUST BE EXECUTED AS ROOT (sudo SCRIPT) AND NEED INTERNET TO WORK!

Installing SocketCAN tools and libsocketcan on your BeagleBone (reboot after each step):

1. First update your kernel to 4.1, which supports capes and CAN. You can use other kernels too, like 3.14, but probably it will not support capes. For that use ```01-install-kernel.sh```.
2. Use ```02-install-dtc-overlays.sh``` to install device tree overlays for BBB (src: https://github.com/beagleboard/bb.org-overlays).
3. Install the can-utils and the libsocketcan running ```03-install-utils.sh```.

Using those 3 steps you be ready to use CAN on your BeagleBone. If you use some CAN cape, probably the system will load the correct device tree for that. To check it you can run ```dmesg | grep cape``` and check if it is loaded at ```cat /sys/devices/platform/bone_capemgr/slots``` (in some versions the path will be /sys/devices/bone_capemgr*/slots ).

If you are not using a cape, no problem. Load the CAN1 device tree using ```echo BB-CAN1 > /sys/devices/platform/bone_capemgr/slots```.

Now, you only need to enable it. For that, I did a simple activation script, which you can modify with your configurations. You just have to run ```04-activate.sh $bitrate``` and pass bitrate as argument (by default is 1000000).

# General observations:
1. You will not need GND to make your communications work as some people say. You just need CANH and CANL pins.
2. For SMALL tests, I used an cutted ethernet cable without any 120 ohms resistor, but it was for SMALL TESTS ONLY!

# CBB-Serial cape observations:
If you are going to use the CBB-Serial cape, don't forget to plug an external 5V font to your BeagleBone because without that the CAN transceiver will not work (you can check the electrical diagram and you will understand). I spent a week until discover that, so don't make the same mistake.