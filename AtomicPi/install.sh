#!/bin/sh
# Installation script for Lubuntu 20.04nano /etc/hosts. Run as root.

SENSEHOSTNAME=$1
GITHOME="https://root@git.durastudio.com/root"
GITMANAGE="manage"
GITPERM="permtecture"

passwd
apt-get install nano
nano /etc/hosts
hostname
ifconfig
aplay -l
cat /etc/sddm.conf
cat /etc/hosts
hostnamectl set-hostname $SENSEHOSTNAME
ssh-keygen -t rsa
git clone $GITMANAGE
cd manage/
cd ssh_keys/
cp ~/.ssh/id_rsa.pub root@$SENSEHOSTNAME.id_rsa.pub
cp auth_keys_internal.txt ~/.ssh/authorized_keys
systemctl restart ssh
ifconfig
df -h
cd /usr/lib/policykit-1/
ls -l
ps afx | less
chmod u+s /usr/bin/sudo
chmod u+s /usr/lib/policykit-1/polkit-agent-helper-1
shutdown -r now
top
cd /etc/polkit-1/
ls -l
cd /usr/share/polkit-1/rules.d/
ls -l
nano blueman.rules
nano /etc/sudoers
nano /etc/group
cd /etc/sysctl.d/
ls -l
nano 99-sysctl.conf
shutdown -r now
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -L
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -L
ifconfig
iptables -t nat -A POSTROUTING -o enpls0 -j MASQUERADE
ifconfig
iptables -L
nano /etc/sysctl.conf
shutdown -r now
iptables -t nat -A POSTROUTING -o enpls0 -j MASQUERADE
iptables -L
ifconfig
iptables -t nat -A POSTROUTING -o enpls0 -j MASQUERADE
iptables -L
apt-get install bridge-utils
iptables -L
nano /etc/sysctl.d/10-network-security.conf
nano /etc/sysctl.conf
nano /etc/sysctl.d/README.sysctl
service procps reload
service procps restart
iptables -L
iptables -t nat -A POSTROUTING -o enpls0 -j MASQUERADE
iptables -L
iptables
iptables -h
ls /sys/class/net
ls /etc/netplan
nano /etc/default/hostapd
systemctl status hostapd
systemctl start hostapd
systemctl enable hostapd
apt search dhcpd
nano /etc/udhcpd.conf
systemctl status udhcpd.service
systemctl restart udhcpd.service
systemctl status udhcpd.service
curl -ik durastudio.com
ls -l
cd manage/
ls-l
ls -
ls -l
git status
git add ssh_keys/root@$SENSEHOSTNAME.id_rsa.pub
git commit -am "added @SENSEJHOSTNAME key"
git config --global user.email "kelley@durastudio.com"
git config --global user.name "root"
git status
git push
git pull
git commit -am "added 1570sense key"
git push
cd /etc/hostapd/
ls -la
nano ifupdown.sh
nano hostapd.conf
systemctl enable hostapd
systemctl umask hostapd
systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd
systemctl status hostapd
ls -l /run/
nano /etc/default/hostapd
systemctl restart hostapd.service
systemctl status hostapd
top
top -i
nano hostapd.conf
systemctl restart hostapd.service
systemctl status hostapd
journalctl -xe
nano hostapd.conf
systemctl restart hostapd.service
journalctl -xe
systemctl status hostapd
nano hostapd.conf
systemctl restart hostapd.service
systemctl status hostapd
iptables -L
cd /etc/ufw/
ls -l
nano applications.d/
nano applications.d/openssh-server
apt search ufw
apt-get install ufw gufw
apt install nftables
apt install firewalld
systemctl enable nftables.service
systemctl status firewalld.service
systemctl start firewalld.service
systemctl status firewalld.service
systemctl status nftables
systemctl start nftables
systemctl status nftables
shutdown -r now
top
top -i
exit
top
ls -l
cd manage/
ls -l
git pull
exit
grep -r 'promiscuous' /var/log/kern.log
grep -r 'promiscuous' /var/log/dmesg
exit
useradd connor
nano /etc/sudoers
nano /etc/sudoers.d/atomicpi
nano /etc/group
exit
grep -r 'promiscuous' /var/log/kern.log
cd manage/
git pull
git status
cd ../
ls -l
git clone https://git.durastudio.com/root/permatecture.git
cd permatecture/
ls -l
cd zabbix/
ls -la
git status
git checkout zabbix
cd ../
ls -l
git branches
git show branches
cd ../manage/
ls -l
git checkout reporting
git checkout Reporting
cd ../permatecture/
git checkout reporting
git checkout Reporting
ls -l
cd zabbix/
ls -l
cd ../Reporting/
ls -l
git checkout master
ls -l
cd ../
ls -l
cd zabbix/
ls -l
git checkout Reporting
cp ../../manage/zabbix/install_zabbix_debian_8.sh .
ls -l
nano install_zabbix_debian_8.sh
git commit -am "added debian 8 zabbix-agent installer"
git add install_zabbix_debian_8.sh
git commit -am "added debian 8 zabbix-agent installer"
git push
nano ../.git/config
cd ../
ls -l
mv zabbix Reporting
git commit -am "moved zabbix into Reporting"
git push
git checkout master
ls -l
mv zabbix Core
ls -l
git commit -am "added Core directory for core functionality"
git push
ls -l
ls -la
