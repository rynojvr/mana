#!/usr/bin/env bash
set -e

echo SensePost Mana Installer
echo [+] This is not a very good installer, it makes a lot of assumptions
echo [+] It assumes you are running Ubuntu 14.04
echo [+] If you are worried about that, hit Ctl-C now, or hit Enter to continue
read

apt-get install -y libnl-utils dnsmasq tinyproxy libssl-dev apache2 macchanger python-dnspython python-pcapy dsniff stunnel4

echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list.d/mana-kali.list
#echo """Package: sslsplit, python-scapy, metasploit-framework
#Pin: release o=Kali, n=kali
#Pin-Priority: 501""" > /etc/apt/preferences.d/mana-kali.list

gpg --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
gpg --armor --export ED444FF07D8D0BF6 | apt-key add -
apt-get update
apt-get install -y sslsplit 
apt-get install -y python-scapy 
#apt-get install -y metasploit-framework

# cp /etc/apparmor.d/usr.sbin.dhcpd /etc/apparmor.d/disable/

make
make install

echo "[+] All done, I think, run one of the run-mana/start-*.sh scripts now"
