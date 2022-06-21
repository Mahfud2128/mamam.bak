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
#sl
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################


MYIP=$(curl -sS ipv4.icanhazip.com)
clear
domain=$(cat /etc/v2ray/domain)
tls=$(cat /etc/xray/vmessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')
vl=$(cat /etc/xray/vlessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/vmessgrpc.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmessgrpc.json
sed -i '/#vlessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vlessgrpc.json
cat > /etc/xray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "GunService",
      "type": "none",
      "host": "${sni}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
##vmesslink#1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
vmesslink1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
vlesslink1="vless://${uuid}@${domain}:${vl}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=${domain}#$user"
systemctl restart vmess-grpc.service
systemctl restart vless-grpc.service
service cron restart
idtele=$(cat /root/.config/idtele)
CHATID="$idtele"
KEY="5437053023:AAHl82bSN55xSrYa4YnmSfgcbrR6uzQUkww"
TIME="10"
BRL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="=================================
           XRAY GRPC            
=================================
Remarks           : ${user}
Domain            : ${domain}
Port VMess        : ${tls}
Port VLess        : ${vl}
ID                : ${uuid}
Alter ID          : 0
Mode              : Gun
Security          : TLS
Type              : grpc
Jaringan          : GRPC
Service Name gRPC : GunService
SNI               : ${domain}
=================================
Link VMess GRPC  : 
${vmesslink1}
=================================
Link VLess GRPC  : 
vless://${uuid}@${domain}:${vl}?mode=gunDANsecurity=tlsDANencryption=noneDANtype=grpcDANserviceName=GunServiceDANsni=${domain}#$user
=================================
Expired On     : $exp
=================================
Kata DAN ubah menjadi Symbol "
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $BRL >/dev/null
systemctl restart vmess-grpc.service
systemctl restart vless-grpc.service
service cron restart

clear
echo -e "================================="
echo -e "            XRAY GRPC            " 
echo -e "================================="
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "Port VMess        : ${tls}"
echo -e "Port VLess        : ${vl}"
echo -e "ID                : ${uuid}"
echo -e "Alter ID          : 0"
echo -e "Mode              : Gun"
echo -e "Security          : TLS"
echo -e "Type              : grpc"
echo -e "Jaringan          : GRPC"
echo -e "Service Name gRPC : GunService"
echo -e "SNI               : ${domain}"
echo -e "================================="
echo -e "Link VMess GRPC  : "
echo -e "${vmesslink1}"
echo -e "================================="
echo -e "Link VLess GRPC  : "
echo -e "${vlesslink1}"
echo -e "================================="
echo -e "Expired On     : $exp"
echo -e "=================================" 
