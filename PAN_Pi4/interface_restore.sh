#!/bin/sh -e
ifconfig eth0 0 up
dhclient br0
