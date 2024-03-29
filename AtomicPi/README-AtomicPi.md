# Open Source Environmental Modeling



This is a <a href="https://github.com/Durastudio-FLOSS/permatecture" title="Permatecture Pro Repo Mirror">git repo</a> for managing code. Please see <a href="https://permatecture.pro" title="Permatecture Pro Project">permatecture.pro</a>  for more.

## Description - Open source system for gathering environmental data  

### Performance specifications

* Hub and Spoke Hybrid Mesh network topology for reliable data collection and system coordination
* Provide 802.x wireless and bluetooth connectivity to nodes. MQTT broker
* Collect and store sensor data
* Secure mobility supported with private vpn
* Forward data only to known network(s)
* Autodiscovery wherever possible.

### AtomicPi SBC - Sensors Hub

Monitor and collect data from sensing nodes and forward to reporting hub. Powerful low cost development platform. https://digital-loggers.com/api.html

* Flash - https://www.digital-loggers.com/downloads/api/atomicpi_ubuntu_focal_lxqt_standalone_1.0.0.206.zip
* https://www.digital-loggers.com/downloads/atomicpi_readme.txt

### Sensor nodes

* Coordinator - Arduino MKR 1010 Wifi with headers
* Sensor Node - Arduino Nano 33 BLE Sense with Headers [ABX00035]
* VEML6075 UV Sensor Module
* Modern Device Wind Sensor Rev. P

### Software ( see install helper scripts in AtomicPi folder)

* HostAPD - https://w1.fi/hostapd/
* Bridge-Utils - https://launchpad.net/bridge-utils
* Udhcpd - https://udhcp.busybox.net/