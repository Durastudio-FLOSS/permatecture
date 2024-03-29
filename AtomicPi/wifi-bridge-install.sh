#!/bin/sh
# Setup secure wifi to ethernet bridge to provide full access point funtionality. MQTT broker needs full network intefration.
# These commands are derived from https://www.thegeekpub.com/240065/setup-a-raspberry-pi-wireless-access-point/
# AtomicPi flashed lubuntu 20.04 from digital-loggers. Link listed on https://permatecture.pro repo page.
# Configured for execution as root user

ETH_DEV=`ip link | awk -F: '$0 !~ "lo|vir|wl|do|^[^0-9]"{print $2;getline}'`
WIFI_DEV=`ip link | awk -F: '$0 !~ "lo|vir|enp|eth|do|^[^0-9]"{print $2;getline}'`

# configure for your distro
UDHCPD_CONF=/etc/default/udhcpd
NET_CONFIG_FILE=/etc/network/interfaces.d/br0

# uncomment and bring sysgtem up to date
# sudo apt-get -y update && sudo apt-get -y upgrade
# apt-get -y update && sudo apt-get -y upgrade

# uncomment to install needed network utilities
# sudo apt-get -y install hostapd bridge-utils udhcpd
# apt-get -y install hostapd bridge-utils udhcpd

# if needed, setup udhcpd.conf
#sudo sed -i s/'DHCPD_ENABLED="no"'/'DHCPD_ENABLED="yes"'/ $UDHCPD_CONF
sed -i s/'DHCPD_ENABLED="no"'/'DHCPD_ENABLED="yes"'/ $UDHCPD_CONF
#sudo systemctl restart udhcpd.service
#systemctl restart udhcpd.service

# deny wifi udhcpd from assigning ip addresses to lan components
if ! grep "denyinterfaces $ETH_DEV" $UDHCPD_CONF ; then
   printf " - configuring $UDHCPD_CONF\n"
   #sudo printf "denyinterfaces $ETH_DEV\ndenyinterfaces $WIFI_DEV\n" >> $UDHCPD_CONF
   printf "denyinterfaces $ETH_DEV\ndenyinterfaces $WIFI_DEV\n" >> $UDHCPD_CONF
   #cat $UDHCPD_CONF | grep  deny
   #sudo systemctl restart udhcpd.service
   systemctl restart udhcpd.service
else
   printf "NOTICE - $UDHCPD_CONF already configured, skipping.\n"
fi

# add bridge block
if ! grep "# AP Bridge setup" $NET_CONFIG_FILE ;  then
   printf "# AP Bridge setup\nauto br0\niface br0 inet dhcp\nbridge_ports $ETH_DEV $WIFI_DEV\n" >> $NET_CONFIG_FILE
   systemctl restart networking.service
else
   printf "NOTICE - $NET_CONFIG_FILE already configured, skipping.\n"
fi

