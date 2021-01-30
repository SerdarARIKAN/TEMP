### DOWNLOAD
- [ ] `wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso`

### PREPARE USB DEVICE
- [ ] `PATH="/sbin:$PATH"`
- [ ] `fdisk –l`
- [ ] `umount /dev/sd*`
- [ ] `mkfs.vfat /dev/sd* –I`
- [ ] `dd if=debian-10.7.0-amd64-netinst.iso of=/dev/sd*`
- [ ] `pgrep –l ‘^dd$’`
