#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS http://lino.griyadigital.xyz:81/ipvps > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS http://lino.griyadigital.xyz:81/ipvps | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS http://lino.griyadigital.xyz:81/ipvps | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear 
cat /usr/bin/bannerku | lolcat
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e " $bl ║ \e[032;1mCPU Model:\e[0m$bd $cname  "
	echo -e " $bl ║ \e[032;1mNumber Of Cores:\e[0m$bd $cores"
	echo -e " $bl ║ \e[032;1mCPU Frequency:\e[0m$bd $freq MHz"
	echo -e " $bl ║ \e[032;1mTotal Amount Of RAM:\e[0m$bd $tram MB"
	echo -e " $op ║ \e[032;1mSystem Uptime:\e[0m$bd $up"
	echo -e " $op ║ \e[032;1mIsp Name:\e[0m$bd $ISP"
        echo -e " $op ║ \e[032;1mIp Vps:\e[0m$bd $IPVPS"
	echo -e " $op ║ \e[032;1mCity:\e[0m$bd $CITY"
	echo -e " $op ║ \e[032;1mTime:\e[0m$bd $WKT                                        ╥"
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                       ┃ MENU OPTIONS ┃                      ║ \e[m" |lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  " \e[32;1m ║\e[m$bd 1$bl]\e[m$bd SSH & OpenVPN Menu                                      ╨"
echo -e  " $gl ║\e[m$bd 2$bl]\e[m$bd Panel Wireguard "
echo -e  " $gl ║\e[m$bd 3$bl]\e[m$bd Panel L2TP & PPTP Account"
echo -e  " $gl ║\e[m$bd 4$bl]\e[m$bd Panel SSTP  Account"
echo -e  " $bl ║\e[m$bd 5$bl]\e[m$bd Panel SSR & SS Account"
echo -e  " $bl ║\e[m$bd 6$bl]\e[m$bd Panel V2Ray"
echo -e  " $bl ║\e[m$bd 7$bl]\e[m$bd Panel VLess"
echo -e  " $bl ║\e[m$bd 8$bl]\e[m$bd Panel TRojanGO"
echo -e  " $bl ║\e[m$bd 9$bl]\e[m$bd Panel TrojanGFW"
echo -e  " $bl ║\e[m$bd 10$bl]\e[m$bd Panel V2Ray GRPC"
echo -e   "  \e[1;32m╠════════════════════════════════════════════════════════════╣\e[m" | lolcat
echo -e   "  ║                       ┃ SYSTEM MENU ┃                       ║\e[m" | lolcat 
echo -e   "  \e[1;32m╠════════════════════════════════════════════════════════════╣\e[m" | lolcat
echo -e   " $mg ║\e[m$bd 11$bl]\e[m$bd Panel Domain"
echo -e   " $mg ║\e[m$bd 12$bl]\e[m$bd Change Port All Account"
echo -e   " $mg ║\e[m$bd 13$bl]\e[m$bd Autobackup Data VPS"
echo -e   " $mg ║\e[m$bd 14$bl]\e[m$bd Backup Data VPS Via Email"
echo -e   " $mg ║\e[m$bd 15$bl]\e[m$bd Setting Backup Data VPS Via Bot"
echo -e   " $mg ║\e[m$bd 16$bl]\e[m$bd Backup Data VPS Via Bot"
echo -e   " $mg ║\e[m$bd 17$bl]\e[m$bd Restore Data VPS"
echo -e   " $gl ║\e[m$bd 18$bl]\e[m$bd Webmin Menu"
echo -e   " $gl ║\e[m$bd 19$bl]\e[m$bd Limit Bandwith Speed Server"
echo -e   " $gl ║\e[m$bd 20$bl]\e[m$bd Check Usage of VPS Ram" 
echo -e   " $gl ║\e[m$bd 21$bl]\e[m$bd Reboot VPS"
echo -e   " $gl ║\e[m$bd 22$bl]\e[m$bd Speedtest VPS"
echo -e   " $gl ║\e[m$bd 23$bl]\e[m$bd Information Display System" 
echo -e   " $gl ║\e[m$bd 24$bl]\e[m$bd Info Script Auto Install"
echo -e   " $gl ║\e[m$bd 25$bl]\e[m$bd Install BBR"
echo -e   " $bl ║\e[m$bd 26$bl]\e[m$bd Set Auto Reboot"
echo -e   " $bl ║\e[m$bd 27$bl]\e[m$bd Status Tunneling"
echo -e   " $bl ║\e[m$bd 28$bl]\e[m$bd Clear Log"
echo -e   " $bl ║\e[m$bd 29$bl]\e[m$bd Restart All Service"
echo -e   " $bl ║\e[m$bd 30$bl]\e[m$bd Change Banner"
echo -e   " $bl ║\e[m$bd 31$bl]\e[m$bd Cek Bandwith"
echo -e   " $bl ║\e[m$bd 32$bl]\e[m$bd Reset Server"
echo -e   " $bl ║\e[m$bd 33$bl]\e[m$bd Update To Last Version                                 ╥"
echo -e   "  \e[1;32m╠════════════════════════════════════════════════════════════╣\e[m" | lolcat
echo -e   "  ║ x)   Exit                                                  ║\e[m" | lolcat
echo -e   "  \e[1;32m╚════════════════════════════════════════════════════════════╝\e[m" | lolcat
echo -e   ""
read -p "     Select From Options [1-33 or x] :  " menu
echo -e   ""
case $menu in
1)
ssh
;;
2)
wgr
;;
3)
l2tp
;;
4)
sstpp
;;
5)
ssssr
;;
6)
v2raay
;;
7)
vleess
;;
8)
trojanGO
;;
9)
trojaan
;;
10)
vgrpc
;;
11)
domain
;;
12)
change-port
;;
13)
autobackup
;;
14)
backup
;;
15)
set-backupbot
;;
16)
backupbot
;;
17)
restore
;;
18)
wbmn
;;
19)
limit-speed
;;
20)
ram
;;
21)
reboot
;;
22)
speedtest
;;
23)
info
;;
24)
about
;;
25)
bbr
;;
26)
auto-reboot
;;
27)
running
;;
28)
clear-log
;;
29)
restart
;;
30)
nano /etc/issue.net
;;
31)
bw
;;
32)
resett
;;
33)
update
;;
x)
exit
;;
*)
echo  "Please enter an correct number"
;;
esac
