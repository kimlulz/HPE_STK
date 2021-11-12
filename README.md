# HPE_STK
Test for HPE Servers.

## Shell Setting
### /efi/boot/grub.cfg
```
(생략)
set GRUB_DEFAULT=0
set timeout=0 // Added
menuentry "HPE Scripting Toolkit Linux Edition 11.51" {
  	echo "Loading Kernel..."
	linux /isolinux/vmlinuz root=/dev/ram0 splash=silent quiet media=usb sstk_conf=toolkit.conf sstk_script=/shell.sh  // Change media method(CDROM->USB) and remove network args.
	echo "Loading Ram Disk..."
	initrd /isolinux/initrd.img
}
```

### /isolinux/isolinux.cfg
```
timeout 1
(생략)
label toolkit
  kernel vmlinuz
  append initrd=initrd.img root=/dev/ram0 splash=silent quiet media=usb sstk_conf=toolkit.conf sstk_script=/shell.sh network=0
```

## Script
### /scripts/shell.sh
```
#!/bin/bash
# INIT
bold=$(tput bold)
normal=$(tput sgr0)

# To install firmware,
# Extract RPM(Firmware), Find directory 'x86_64-linux-gnu', Put to /firmware
# /media/HPESTK1151/firmware/x86_64-linux-gnu/[firmware]/setup -s -f

echo "##################TEST##################"

echo "${bold}*****     BIOS     *****"
echo "Version - 2.56${normal}"
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-system-u30-2.56_2021_10_28-1.1/setup -s -f
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-system-u32-2.56_2021_10_28-1.1/setup -s -f
echo "OK"

echo "${bold}*****     ILO     *****"
echo "Version - 2.55${normal}"
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-ilo5-2.55-1.1/setup -s -f
echo "OK"

echo "${bold}*****     ARRAY     *****"
echo "Version - 4.11${normal}"
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-smartarray-f7c07bdbbd-4.11-1.1/setup -s -f
echo "OK"

echo "${bold}*****     NIC     *****"
echo "Broadcom NIC - 2.28.${normal}4"
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-nic-broadcom-2.28.4-1.1/setup -s -f
echo "${bold}Intel NIC - 1.22.6${normal}"
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-nic-intel-1.22.6-1.1/setup -s -f
echo "OK"

echo "${bold}*****     SPS     *****"
echo "Version - 04.01.04.505${normal}"
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-spsgen10-04.01.04.505-1.1/setup -s -f
echo "OK"

echo "${bold}*****     IE     *****"
echo "Version - 0.2.2.3${normal}"
/media/HPESTK1151/firmware/x86_64-linux-gnu/firmware-iegen10-0.2.2.3-1.1/setup -s -f
echo "OK"

sleep 15
echo "${bold}*****************************************************"
echo "UPDATE FINISHED"
echo "Make sure you check the firmware version on the bios!!!"
echo "Power will be turned off within 15 seconds."
echo "*****************************************************${normal}"
sleep 15
poweroff -f
exec /bin/bash

```
