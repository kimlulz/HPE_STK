# HPE_STK
HPE STK running on USB    
Based on HPE Scripting Toolkit 11.60    

## Shell Setting
### grub.cfg, syslinux.cfg, isolinux.cfg
Delete the syntax associated with network(and ipv4 options)   
* Syslinux.cfg, isolinux.cfg - change `media=cdrom` to `media=usb`    

## Script
### /scripts/shell.sh
```
#!/bin/bash
# INIT
bold=$(tput bold)
normal=$(tput sgr0)

# To install firmware,
# Extract RPM(Firmware), Find directory 'x86_64-linux-gnu', Put to /firmware
# /media/HPESTK1160/firmware/x86_64-linux-gnu/[firmware]/setup -s -f

echo "*************************"
echo "by kIM1uL2"
echo "${bold}HPE Scripting Toolkit"
echo "Version - 11.60"
echo "/media/HPESTK1160/"
echo "*************************"

echo "${bold}*****     BIOS     *****"
echo "Version - 2.56${normal}"
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-system-u30-2.56_2021_10_28-1.1/setup -s -f
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-system-u32-2.56_2021_10_28-1.1/setup -s -f
echo "OK"

echo "${bold}*****     ILO     *****"
echo "Version - 2.55${normal}"
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-ilo5-2.55-1.1/setup -s -f
echo "OK"

echo "${bold}*****     ARRAY     *****"
echo "Version - 4.11${normal}"
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-smartarray-f7c07bdbbd-4.11-1.1/setup -s -f
echo "OK"

echo "${bold}*****     NIC     *****"
echo "Broadcom NIC - 2.28.4${normal}"
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-nic-broadcom-2.28.4-1.1/setup -s -f
echo "${bold}Intel NIC - 1.22.6${normal}"
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-nic-intel-1.22.6-1.1/setup -s -f
echo "OK"

echo "${bold}*****     SPS     *****"
echo "Version - 04.01.04.505${normal}"
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-spsgen10-04.01.04.505-1.1/setup -s -f
echo "OK"

echo "${bold}*****     IE     *****"
echo "Version - 0.2.2.3${normal}"
/media/HPESTK1160/firmware/x86_64-linux-gnu/firmware-iegen10-0.2.2.3-1.1/setup -s -f
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
