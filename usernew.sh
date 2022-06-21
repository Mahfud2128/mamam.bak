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
echo -e "Name : Create SSH & OpenVPN Account" | lolcat
echo -e "=============================="
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- ifconfig.co);
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
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
SSH, OpenVPN Account Info
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
