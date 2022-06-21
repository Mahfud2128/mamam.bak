#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
trojango="$(cat ~/log-install.txt | grep -i TrojanGO | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
                echo "Name : Create Trojan GO Account"
		echo "=================================="
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "Expired (days) : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
trojangolink="trojan://${user}@${domain}:${trojango}/?sni=${domain}&type=ws&host=${domain}&path=/trojangoDANencryption=none#${user}"
idtele=$(cat /root/.config/idtele)
CHATID="$idtele"
KEY="5437053023:AAHl82bSN55xSrYa4YnmSfgcbrR6uzQUkww"
TIME="10"
BRL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="Name : Trojan-GO
===================================
Remarks    = ${user}
IP / Host  = ${domain}
Port       = ${trojango}
Path       = /trojango
Expired    = $exp
===================================
Link TROJAN-GO : ${trojangolink}
===================================" 
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $BRL >/dev/null
clear
echo -e "Name : Trojan-GO" 
echo -e "===================================" | lolcat
echo -e "Remarks    = ${user}"
echo -e "IP / Host  = ${domain}"
echo -e "Port       = ${trojango}"
echo -e "Path       = /trojango"
echo -e "Expired    = $exp"
echo -e "===================================" | lolcat
echo -e "Link TROJAN-GO : ${trojangolink}"
echo -e "===================================" | lolcat
