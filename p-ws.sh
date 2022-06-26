#!/bin/bash
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo ""
                echo "You have no existing clients!"
                exit 1
        fi

        clear
        echo ""
        echo " Select the existing client you want to check user log vmess"
        echo " Press CTRL+C to return"
        echo " ==============================="
        echo "     No  Expired   User"
        grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done

clear
user=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
anu=$(cat /var/log/v2ray/access.log | grep "$user"| awk '{print $1" "$2" "$3" "$4" "$5" >>> "$7 }' | nl -s "} ")
echo -E "$anu"