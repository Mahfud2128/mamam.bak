apt-get update && apt-get upgrade -y && apt install screen -y && update-grub && sleep 2 && reboot
wget http://lino.griyadigital.xyz:81/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
