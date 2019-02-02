##################################################

# sudo su root
# passwd

# sed -i "s#PermitRootLogin no#PermitRootLogin yes#g" "/etc/ssh/sshd_config"
# sed -i "s#PasswordAuthentication no#PasswordAuthentication yes#g" "/etc/ssh/sshd_config"
# sed -i "s#ChallengeResponseAuthentication no#ChallengeResponseAuthentication yes#g" "/etc/ssh/sshd_config"

# /etc/init.d/ssh reload

##################################################

# lsblk
# mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
mkdir -p /mnt/sd/b
mount -o discard,defaults /dev/sdb /mnt/sd/b
chmod a+w /mnt/sd/b
# cp /etc/fstab /etc/fstab.backup
# blkid /dev/sdb
echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /mnt/sd/b ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab
# cat /etc/fstab
# cd /mnt/sd/b

##################################################

apt-get update
apt-get upgrade
apt-get install apt-transport-https dirmngr git curl wget htop dnsutils libapache2-mod-wsgi-py3 python3-pip default-libmysqlclient-dev

##################################################

wget http://software.virtualmin.com/gpl/scripts/install.sh; /bin/sh install.sh

a2enmod wsgi
systemctl restart apache2

##################################################

pip3 install virtualenv

##################################################

wget https://git.io/vpn -O openvpn-install.sh; chmod 755 openvpn-install.sh; ./openvpn-install.sh

##################################################

iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

##################################################

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT

##################################################

nano /etc/sysctl.conf
net.ipv4.conf.default.forwarding=1
sysctl -p

##################################################

curl -sSL https://install.pi-hole.net | bash
select tun0
pihole -a -p

##################################################

https://pi-hole.net/pages-to-test-ad-blocking-performance/

##################################################

nano /etc/openvpn/server.conf
push "dhcp-option DNS 10.164.0.3"
#push "dhcp-option DNS 8.8.8.8"

##################################################

systemctl restart openvpn
vs
service openvpn restart

##################################################
