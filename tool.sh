#!/bin/bash

commands=(
    "apt update && apt install bmon iftop dnsutils iptoute2 tshark net-tools tcptrack iptraf-ng"
    "tshark -i $var -w network.pcap -F libpcap"
    "tcptrack -i $var"
    "hostnamectl status"
    "journalctl -b"
    "ss -tulpn"
    "iptraf-ng"
    "mysql -u root -p $var <$var"
    "ss -a"
    "apt install fail2ban"
    "fail2ban-client status"
    "fail2ban-client status sshd"
    "tmux ls"
    "tmux attach-session -t $var"
    "wget https://github.com/agungsoboru/btop/blob/e75a6585bc0b89c81cc74075ff24008f2601e0dd/btop?raw=true -O /usr/bin/btop"
    "apt update  && apt install shadowsocks-libev"
)
keterangan=(
    "install net-tools (bmon iftop dnsutils iptoute2 tshark net-tools tcptrack iptraf-ng)"
    "paket capture tshark"
    "hostnamectl status"
    "journalctl -b"
    "show open port"
    "net mon iptraf-ng"
    "import sql to database"
    "ss -a"
    "install fail2ban"
    "fail2ban-client status"
    "fail2ban-client status sshd"
    "tmux ls"
    "tmux attach-session -t $var"
    "install btop"
    "install proxy shadowshock"
    
)

if [ $# -eq 0 ]; then
    echo "Please enter a number from 1 to ${#commands[@]}"
    echo "Available commands:"
    for ((i=1; i<=${#commands[@]}; i++)); do
        echo "$i - ${keterangan[$i-1]}"
    done
else

    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "Error: Argument must be a number"
        exit 1
    fi

    if [ $1 -lt 1 ] || [ $1 -gt ${#commands[@]} ]; then
        echo "Error: Number out of range"
        exit 1
    fi

    eval "${commands[$1-1]}"
fi
