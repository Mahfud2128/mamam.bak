#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "Name : Change Port All Service"
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Change Port Stunnel4" | lolcat
echo -e "     [2]  Change Port OpenVPN" | lolcat
echo -e "     [3]  Change Port Wireguard" | lolcat
echo -e "     [4]  Change Port Vmess" | lolcat
echo -e "     [5]  Change Port Vless" | lolcat
echo -e "     [6]  Change Port Trojan" | lolcat
echo -e "     [7]  Change Port Squid" | lolcat
echo -e "     [8]  Change Port SSTP" | lolcat
echo -e "     [9]  Change Port Trojan Go" | lolcat
echo -e "     [10]  Change Port Xray GRPC" | lolcat
echo -e "     [11]  Change Port Trojan GRPC" | lolcat
echo -e "     [x]  Exit"| lolcat
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-10 or x] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
4)
port-ws
;;
5)
port-vless
;;
6)
port-tr
;;
7)
port-squid
;;
8)
port-sstp
;;
9)
port-trgo
;;
10)
port-grpc
;;
11)
port-trgrpc
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
