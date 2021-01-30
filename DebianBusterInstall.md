### DOWNLOAD
- [ ] `wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso`

### PREPARE USB DEVICE
- [ ] `PATH="/sbin:$PATH"`
- [ ] `fdisk –l`
- [ ] `umount /dev/sd*`
- [ ] `mkfs.vfat /dev/sd* –I`
- [ ] `dd if=debian-10.7.0-amd64-netinst.iso of=/dev/sd*`
- [ ] `pgrep –l ‘^dd$’`

### POST INSTALL
- [ ] `echo "iface wlp5s1 inet dhcp" >> "/etc/network/interfaces"`
- [ ] `echo "wpa-ssid SAS2.4Ghz" >> "/etc/network/interfaces"`
- [ ] `echo "wpa-psk ********" >> "/etc/network/interfaces"`
- [ ] `ip link set wlp5s1 up`
- [ ] `ifup wlp5s1`
- [ ] `apt-get install firmware-realtek firmware-misc-nonfree intel-microcode kde-plasma-desktop plasma-nm firefox-esr chromium`
- [ ] `echo "user  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/user`
- [ ] `sed -i "s#iface wlp5s1 inet dhcp# #g" "/etc/network/interfaces"`
- [ ] `sed -i "s#wpa-ssid SAS2.4Ghz# #g" "/etc/network/interfaces"`
- [ ] `sed -i "s#wpa-psk ********# #g" "/etc/network/interfaces"`
