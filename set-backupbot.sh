#!/bin/bash
clear
neofetch
echo -e "Silahkan cek CHAT ID anda di tele @get_id_bot" | lolcat
echo -e "lalu klik start atau cmd /my_id" | lolcat
echo -e ""
ID=$(cat /usr/bin/backupbot | grep CHATID=  | sed 's/"//g' | sed 's/CHATID//g' | sed 's/=//g')

read -p "Masukkan Chat ID Telegram Anda=" idbaru

sed -i "s/$ID/$idbaru/g" /root/backupbot

echo -e ""
echo -e "kemudian cari Bot @GDStore_bot" | lolcat
echo -e "lalu start" | lolcat
