#!/bin/bash
# INIT
b=$(tput bold) # 굵게
n=$(tput sgr0) # 일반글씨
r="\033[41;37m" # 빨간색 배경 글씨
w="\033[0m" #일반 배경 글씨
nd='sed 's/[^0-9,.]//g'' # 숫자 점 추출
# Open RPM(Firmware) via 7zip, open .cpio, find directory 'x86_64-linux-gnu', Drag to /firmware/

# 양식 (주석 제거하고 사용 할 것)
# echo "*****     [펌웨어]     *****"
# echo -n "[펌웨어이름] Ver : ; cat /firmware/[펌웨어]/CP*.xml | grep "<Version>" | ${nd}  <-- 펌웨어 버전 읽기
# /firmware/[펌웨어폴더명]/setup -s -f

echo "${b}*************************"
echo "by kIM1uL2"
echo "HPE Scripting Toolkit 11.60"
echo "FIRMWARE UPDATE"
echo "*************************${n}"

echo "${b}Copy all firmware to RAMDISK${n}"
mkdir /firmware
cp -r /media/HPESTK1160/firmware/x86_64-linux-gnu/* /firmware
echo -e "${b}${r}OK${w}${n}"

echo ""

echo "${b}*****     BIOS     *****"
echo -n "DL380 ROM Ver : " ; cat firmware-system-u30-*/CP*.xml | grep "<Version>" | $nd
/firmware/firmware-system-u30-2.56_2021_10_28-1.1/setup -s -f
echo -n "DL360 ROM Ver : " ; cat firmware-system-u32-*/CP*.xml | grep "<Version>"
/firmware/firmware-system-u32-2.56_2021_10_28-1.1/setup -s -f
echo -e "${b}${r}OK${w}${n}"

echo "${b}*****     ILO     *****"
echo -n "ILO 5 Ver : " ; cat /firmware/firmware-ilo5-*/CP*.xml | grep "<Version>" | $nd
/firmware/firmware-ilo5-2.55-1.1/setup -s -f 
echo -e "${b}${r}OK${w}${n}"

echo "${b}*****     ARRAY     *****"
echo -n "ARRAY Ver : " ; cat /firmware/firmware-smartarray-*/CP*.xml | grep "<Version>" | uniq | $nd
echo "${n}"
/firmware/firmware-smartarray-f7c07bdbbd-4.11-1.1/setup -s -f
echo -e "${b}${r}OK${w}${n}"

echo "${b}*****     NIC     *****"
echo -n "BROADCOM NIC Ver : " ; cat /firmware/firmware-nic-broadcom-*/CP*.xml | grep "<Version>" | uniq | $nd
/firmware/firmware-nic-broadcom-2.28.4-1.1/setup -s -f
echo -n "Intel NIC Ver : " ; cat /firmware/firmware-nic-intel-*/CP*.xml | grep  "<version value=" | head -1 | $nd | sed 's/.$//'
/firmware/firmware-nic-intel-1.22.6-1.1/setup -s -f
echo -e "${b}${r}OK${w}${n}"

echo "${b}*****     SPS     *****"
echo -n "SPS Ver : " ; cat /firmware/firmware-spsgen10-*/CP*.xml | grep "<Version>" | uniq | $nd
/firmware/firmware-spsgen10-04.01.04.505-1.1/setup -s -f
echo -e "${b}${r}OK${w}${n}"

echo "${b}*****     IE     *****"
echo -n "IE Ver : " ; cat /firmware/firmware-iegen10-*/CP*.xml | grep "<Version>" | uniq | $nd
/firmware/firmware-iegen10-0.2.2.3-1.1/setup -s -f
echo -e "${b}${r}OK${w}${n}"

echo "${b}*****     DISK     *****${n}"
echo "${b}MB004000GWWQH, MB002000GWWQF, MB001000GWWQE${n}"
/firmware/firmware-hdd-12304c1aca-HPG3-3.1/setup -s -f
echo ""
echo "${b}MB008000GWRTC${n}"  
/firmware/firmware-hdd-82894b9e0a-HPG1-5.1/setup -s -f
echo ""
echo "${b}VK000240GWSRQ, VK000480GWSRR, VK000960GWSRT, VK001920GWSRU, VK003840GWSRV${n}"
/firmware/firmware-hdd-db687966b4-HPG4-3.1/setup -s -f
echo -e "${b}${r}OK${w}${n}"
sleep 5
echo -e "${b}${r}*****************************************************${w}${n}"
echo -e "${b}${r}UPDATE FINISHED${w}${n}"
echo -e "${b}${r}Make sure you check the firmware version on the bios!!!${w}${n}"
echo -e "${b}${r}Power will be turned off within 15 seconds.${bwc}${normal}"
echo -e "${b}${r}*****************************************************${w}${n}"
sleep 15
poweroff -f