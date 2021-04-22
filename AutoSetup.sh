#!/bin/bash

echo "preinstall packages download"
apt-get update
apt-get upgrade
apt-get install vim hostapd openvswitch-switch
#git clone https://github.com/DamToneLee/PAN_Pi4.git
echo "preinstall packages has been downloaded."

echo "setting bluetooth PAN"
cd PAN_Pi4/
cp ./blueagent5.py ./bt-pan.py /usr/local/bin/
cp ./blueagent5.py ./bt-pan.py /usr/local/bin/
chmod 755 /usr/local/bin/*.py
ln -s /usr/local/bin/blueagent5.py /usr/local/bin/blueagent5
ln -s /usr/local/bin/bt-pan.py /usr/local/bin/bt-pan
vim /etc/network/interfaces
cp blueagent5.service /etc/systemd/system/blueagent5.service
systemctl enable blueagent5
cp bt-pan.service /etc/systemd/system/bt-pan.service
systemctl enable bt-pan
cp custom.target /etc/systemd/system/custom.target
ln -sf /etc/systemd/system/custom.target /etc/systemd/system/default.target
cp pan-network.sh /usr/local/bin/pan-network.sh
chmod 755 /usr/local/bin/pan-network.sh
cp pan-network.service /etc/systemd/system/pan-network.service
systemctl enable pan-network
vim /etc/sysctl.conf
service bluetooth restart
echo "bluetooth PAN setting done."

echo "WiFi AP setting"
cp hostapd.conf ~/hostapd.conf
echo "WiFi AP setting done."
echo "all packages installed."
exit 0