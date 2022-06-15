#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Mahfud2128/mamam/main/ipvps.sh > /root/tmp
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
Name=$(curl -sS https://raw.githubusercontent.com/Mahfud2128/mamam/main/ipvps.sh | grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/Mahfud2128/mamam/main/ipvps.sh | awk '{print $4}' | grep $MYIP)
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
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
clear
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
read -p " Hostname / Domain: " host
mkdir /var/lib/premium-script;
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo "$host" >> /etc/xray/domain
echo "$host" >> /root/domain
#install ssh ovpn
wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
#wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
#wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install wireguard
#wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install L2TP
#wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget -O set-br.sh https://raw.githubusercontent.com/Mahfud2128/mamam/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#install trojan-go
#wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/ins-trgo.sh && dos2unix ins-trgo.sh && chmod +x ins-trgo.sh && ./ins-trgo.sh
#install xray-grpc
wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/xray-grpc.sh && chmod +x xray-grpc.sh && ./xray-grpc.sh
#log
#wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/log.sh && dos2unix log.sh && chmod +x log.sh && ./log.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/wg.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
#rm -f /root/ins-trgo.sh
#rm -f /root/log.sh
rm -f /root/xray-grpc.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://premium-server.xyz
[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
#wget -O /etc/set.sh "https://raw.githubusercontent.com/Gl33ch3r/autoscript/main/set.sh"
#chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "===============================-{ Autoscript Premium }-=========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 8443, 902"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - WebSocket/WS Ovpn       : 2086"  | tee -a log-install.txt
echo "   - WebSocket/WS Non SSL    : 2082"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo "   - Vmess GRPC              : 2053"  | tee -a log-install.txt
echo "   - Vless GRPC              : 2096"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]" | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "==========================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt
echo "Installation has been completed!!"
echo " "
 echo " Reboot 10 Sec"
sleep 10
rm -f setup.sh
reboot
