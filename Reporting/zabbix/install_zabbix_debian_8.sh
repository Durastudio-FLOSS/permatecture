#!/bin/sh
# uncomment to install
wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+jessie_all.deb
sudo dpkg -i zabbix-release_5.0-1+jessie_all.deb
sudo apt-get update
sudo apt-get upgrade && sudo apt-get install zabbix-agent
sudo nano /etc/zabbix/zabbix_agentd.conf
sudo mkdir /var/log/zabbix-agent
sudo chown zabbix.zabbix /var/log/zabbix-agent
systemctl enable zabbix-agent
systemctl start zabbix-agent
systemctl status zabbix-agent
systemctl restart zabbix-agent

# Hardcoded ServerIP, ToDo: add cli variable check.

LogFileSizeLimitMB=1
SourceIPOutgoing=`ifconfig eth0 | awk '/inet addr/ {gsub("addr:", "", $2); print $2}'`
#ServerIP=192.168.0.??? # edit to taste
ListenIP=$SourceIPOutgoing
ServerActive=$ServerIP
AgentdConfigFile=/etc/zabbix/zabbix_agentd.conf
#AgentLogFile=/var/log/zabbix-agent # unused, needs testing

printf "\n========== Getting Debian 8 'Jessie' repo info ==========\n"
if [ ! -f ./zabbix-release_5.0-1+jessie_all.deb ] ; then
   curl -O --silent https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+jessie_all.deb

   printf "\n========== Adding repo to sources ==========\n"
   sudo dpkg -i zabbix-release_5.0-1+jessie_all.deb

   printf "\n========== Updating repo lists ==========\n"
   sudo apt-get -qq update
else
   printf "\n========== Repo info found, not updating ==========\n"
fi

printf "\n========== Upgrading system  ==========\n"
sudo apt-get -qq upgrade

printf "\n========== Installing zabbix agent ==========\n"
sudo apt-get -qq install zabbix-agent

printf "\n==========Configuring $AgentdConfigFile ==========\n"
sed -i s/"^LogFileSize=0$"/"LogFileSize=$LogFileSizeLimitMB"/ $AgentdConfigFile
sed -i s/"^# SourceIP=$"/"SourceIP=$SourceIPOutgoing"/ $AgentdConfigFile
sed -i s/"^Server=127.0.0.1$"/"Server=$ServerIP"/ $AgentdConfigFile
sed -i s/"^# ListenIP=$"/"ListenIP=$ListenIP"/ $AgentdConfigFile
sed -i s/"^ServerActive=$"/"ServerActive=$ServerActive"/ $AgentdConfigFile
sed -i s/"^Hostname=Zabbix server$"/"# Hostname=Zabbix server"/ $AgentdConfigFile

printf "\n========== Checking $AgentdConfigFile ==========\n"
if grep -q ^LogFileSize=$LogFileSizeLimitMB $AgentdConfigFile ; then
   echo "OK - LogFileSize found"
else
   echo "Oops, LogFileSize not found in $AgentdConfigFile. Needs manual edit"
   exit 0 
fi

if grep -q $SourceIPOutgoing $AgentdConfigFile ; then
   echo "OK - SourceIP located"
else
   echo "Wowza, SourceIP not found in $AgentdConfigFile. Edit required"
   exit 0
fi

if grep -q $ServerIP $AgentdConfigFile ; then
   echo "OK - ServerIP found"
else
   echo "Aw Shucks, ServerIP not found in $AgentdConfigFile, Edit please"
   exit 0
fi

if grep -q $ListenIP $AgentdConfigFile ; then
   echo "OK - ListenIP found"
else
   echo "Crikey, ListenIP  not found in $AgentdConfigFile, Nano it now"
   exit 0
fi 

if grep -q $ServerActive $AgentdConfigFile ; then 
   echo "OK - ServerActive found"
else
   echo "Damnation, ServerActive not found in $AgentdConfigFile, Fixeroo time"
   exit 0
fi

if grep -q ^$Hostname $AgentdConfigFile ; then 
   echo "OK - Hostname commented"
else
   echo "Zonkers, Hostname not commented in $AgentConfigFile, Resolve-o-rama"
   exit 0
fi

if [ -d /var/log/zabbix-agent ] ; then  # not sure why this. being done above, checking anyway
   echo "OK - log dir found"
else
   echo "Woopsie - log dir not configured, dooinit"
   sudo mkdir /var/log/zabbix-agent
   sudo chown zabbix.zabbix /var.log/zabbit-agent
fi

printf "\n========== All checks passed. Enabling zabbix-agentd ==========\n"
systemctl enable zabbix-agent

printf "\n========== Starting zabbix-agentd ==========\n"
systemctl start zabbix-agent

printf "\n========== Getting Zabbix-agentd status\n"
systemctl status zabbix-agent

printf "\n========== Tailing /var/log/zabbix-agent/zabbix-agentd.log ==========\n"
watch tail /var/log/zabbix-agent/zabbix_agentd.log
