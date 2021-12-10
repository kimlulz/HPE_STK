#!/bin/bash
# INIT
bold=$(tput bold)
normal=$(tput sgr0)

cat /media/HPESTK1160/localbin/main

echo "${bold}*************************"
echo "Select script"
echo "      1) firmware"
echo "      2) capture"
echo "      3) get"
echo ""
echo "      b) bash shell"
echo "      s) systeminfo"
echo "      e) poweroff"
echo "      r) reboot"
echo "*************************${normal}"
read num

case $num in
    1) bash ./firmware.sh;;
    2) bash ./capture.sh;;
    3) bash ./get.sh;;
    b) bash ./bash.sh;; 
    s) bash ./systeminfo.sh;; 
    e) poweroff -f;;
    r) reboot -f;;
esac
