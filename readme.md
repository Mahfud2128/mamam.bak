apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot


sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && wget https://raw.githubusercontent.com/Mahfud2128/mamam/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
