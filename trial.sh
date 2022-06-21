#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"

clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
IP=$(wget -qO- ifconfig.co);
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
idtele=$(cat /root/.config/idtele)
CHATID="$idtele"
KEY="5437053023:AAHl82bSN55xSrYa4YnmSfgcbrR6uzQUkww"
TIME="10"
BRL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="Thank You For Using Our Services
SSH & OpenVPN Account Info
==============================
Username      : $Login
Password      : $Pass
==============================
ISP           : $ISP
Host          : $IP
Domain        : $domain
OpenSSH       : 22
Dropbear      : 109, 143
WS SSL/TLS    :$ssl
WS Non SSL    : 2082
WS Ovpn       : 2086
Port Squid    :$sqd
badvpn        : 7100-7300
==============================
OpenVPN       : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn
OpenVPN       : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn
OpenVPN       : SSL 442 http://$IP:81/client-tcp-ssl.ovpn
==============================
[PAYLOAD SSH WS]
GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
==============================
Payload Websocket SSL/TLS
==============================
GET wss://bug.com [protocol][crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
==============================
Expired On    : $exp"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $BRL >/dev/null

clear
echo -e ""
echo -e "Thank You For Using Our Services" | lolcat
echo -e "  SSH & OpenVPN Account Info"
echo -e "==============================" | lolcat
echo -e "Username      : $Login "
echo -e "Password      : $Pass"
echo -e "==============================" | lolcat
echo -e "ISP           : $ISP"
echo -e "Host          : $IP"
echo -e "Domain        : $domain"
echo -e "OpenSSH       : 22"
echo -e "Dropbear      : 109, 143"
echo -e "WS SSL/TLS    :$ssl"
echo -e "WS Non SSL    : 2082"
echo -e "WS Ovpn       : 2086"
echo -e "Port Squid    :$sqd"
echo -e "badvpn        : 7100-7300"
echo -e "==============================" | lolcat
echo -e "OpenVPN       : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN       : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN       : SSL 442 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "==============================" | lolcat
echo -e "[PAYLOAD SSH WS]"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================" | lolcat
echo -e "Payload Websocket SSL/TLS"
echo -e "=============================="
echo -e "GET wss://bug.com [protocol][crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================" | lolcat
echo -e "Expired On    : $exp"
