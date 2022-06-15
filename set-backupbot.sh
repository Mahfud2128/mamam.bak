#!/bin/bash
clear
neofetch
echo -e "Silahkan cek CHAT ID anda di tele @get_id_bot" | lolcat
echo -e "lalu klik start atau ketik /my_id" | lolcat
echo -e ""
ID=$(cat /usr/bin/backupbot | grep CHATID=  | sed 's/"//g' | sed 's/CHATID//g' | sed 's/=//g')

read -p "Masukkan Chat ID Telegram Anda=" idbaru

sed -i "s/$ID/$idbaru/g" /usr/bin/backupbot

echo -e ""
echo -e "Sebelum backup, cari Bot @GDStore_bot" | lolcat
echo -e "lalu start" | lolcat
