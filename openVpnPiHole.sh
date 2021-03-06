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

# nano /etc/sysctl.conf
# net.ipv4.conf.default.forwarding=1
sysctl -p

##################################################

curl -sSL https://install.pi-hole.net | bash
# select tun0
pihole -a -p

##################################################

# https://pi-hole.net/pages-to-test-ad-blocking-performance/

##################################################

# nano /etc/openvpn/server.conf
# push "dhcp-option DNS 10.164.0.3"
# push "dhcp-option DNS 8.8.8.8"

##################################################

systemctl restart openvpn
vs
service openvpn restart

##################################################
