# ~/.profile: executed by Bourne-compatible login shells.

if [ "/bin/bash" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
MYIP=$(curl -s ipv4.icanhazip.com)
exp=$(curl -s griya-digital.my.id:81/ipvps | grep $MYIP | awk '{print$3}')
name=$(curl -s griya-digital.my.id:81/ipvps | grep $MYIP | awk '{print$2}')
screen -r setup
clear
neofetch
echo -e "Welcome To Autscript \"GDStore\"\nName: $name""\nExp Script: $exp""\nKetik Menu Untuk Melihat Daftar Perintah" | boxes -d cat | lolcat
