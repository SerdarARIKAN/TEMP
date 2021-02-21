---
## DEBIAN BUSTER
---

### DOWNLOAD
- [ ] `wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso`
---
### PREPARE USB DEVICE
- [ ] `PATH="/sbin:$PATH"`
- [ ] `fdisk –l`
- [ ] `umount /dev/sd*`
- [ ] `mkfs.vfat /dev/sd* –I`
- [ ] `dd if=debian-10.7.0-amd64-netinst.iso of=/dev/sd*`
- [ ] `pgrep –l ‘^dd$’`
---
### POST INSTALL
---
#### WiFi Setup
- [ ] `echo "iface wlp5s1 inet dhcp" >> "/etc/network/interfaces"`
- [ ] `echo "wpa-ssid SAS2.4Ghz" >> "/etc/network/interfaces"`
- [ ] `echo "wpa-psk ********" >> "/etc/network/interfaces"`
- [ ] `ip link set wlp5s1 up`
- [ ] `ifup wlp5s1`
---
#### Base Apps Install
- [ ] `apt-get update`
- [ ] `apt-get upgrade`
- [ ] `apt-get install firmware-realtek firmware-misc-nonfree intel-microcode kde-plasma-desktop plasma-nm firefox-esr chromium latte-dock python3-distutils
`


##### Atom Install
- [ ] `wget https://atom-installer.github.com/v1.54.0/atom-amd64.deb?s=1610567452&ext=.deb`
- [ ] `sudo apt install ./atom-amd64.deb`

##### VirtualBox Install
- [ ] `wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -`
- [ ] `echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list`
- [ ] `sudo apt-get update`
- [ ] `sudo apt-get upgrade`
- [ ] `sudo apt-get install virtualbox-6.0`

##### Kvantum Install
- [ ] `sudo apt-get install qt5-style-kvantum`
---
#### sudo Settings
- [ ] `echo "user  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/user`
---
#### WiFi ReSetup
- [ ] `sed -i "s#iface wlp5s1 inet dhcp# #g" "/etc/network/interfaces"`
- [ ] `sed -i "s#wpa-ssid SAS2.4Ghz# #g" "/etc/network/interfaces"`
- [ ] `sed -i "s#wpa-psk ********# #g" "/etc/network/interfaces"`
---
#### GRUB Conf
- [ ] `sudo sed -i "s#GRUB_TIMEOUT=5#GRUB_TIMEOUT=0#g" "/etc/default/grub"
`

---
### OpenVPN
---
- [ ] `sudo apt-get install openvpn`
- [ ] `sudo openvpn --config /path/to/config.ovpn`

---
## RASPBERRY PI OS
---
---
### img - SDCard
---
SDCard to img
- [ ] `dd if=/dev/sdc of=sdimage.img bs=4M` status=progress

img to SDCard
- [ ] `dd if=sdimage.img of=/dev/sdc bs=4M` status=progress
