#!/bin/sh -e
# BlueTooth PAN Setup
/sbin/modprobe bnep
/bin/hciconfig hci0 lm master,accept
/sbin/ip link set pan0 up
# end BlueTooth
