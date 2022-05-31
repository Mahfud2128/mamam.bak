#!/bin/bash
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
wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install L2TP
#wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget -O set-br.sh https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#install trojan-go
#wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/ins-trgo.sh && dos2unix ins-trgo.sh && chmod +x ins-trgo.sh && ./ins-trgo.sh
#install xray-grpc
wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/xray-grpc.sh && chmod +x xray-grpc.sh && ./xray-grpc.sh
#log
wget https://raw.githubusercontent.com/Raydinzzzzz/Autoscript/main/log.sh && dos2unix log.sh && chmod +x log.sh && ./log.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/wg.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ins-trgo.sh
rm -f /root/log.sh
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
#wget -O /etc/set.sh "https://raw.githubusercontent.com/agian123/gasken/main/set.sh"
#chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
 echo " Reboot 10 Sec"
sleep 10
rm -f setup.sh
reboot
