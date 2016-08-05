#!/bin/bash

# if not root, run as root
if (( $EUID != 0 )); then
    sudo /root/updateme.sh
    exit
fi

touch /root/updateme.log

apt-get update | tee -a /root/updateme.log
echo "---apt-get update completed.---------------------" | tee -a /root/updateme.log

apt-get -y upgrade | tee -a /root/updateme.log
echo "---apt-get -y upgrade completed.---------------------" | tee -a /root/updateme.log

apt-get -y dist-upgrade | tee -a /root/updateme.log
echo "---apt-get -y dist-upgrade completed.---------------------" | tee -a /root/updateme.log

apt-get clean | tee -a /root/updateme.log
echo "---apt-get clean completed.---------------------" | tee -a /root/updateme.log

apt-get -y autoremove | tee -a /root/updateme.log
echo "---apt-get -y autoremove completed.---------------------" | tee -a /root/updateme.log
