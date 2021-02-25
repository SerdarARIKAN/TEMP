---
## RASPBERRY PI OS
---

### img - SDCard
- [ ] `lsblk -p`
- [ ] `umount sdX`

#### SDCard to img
- [ ] `dd if=/dev/sdX of=sdimage.img bs=4M status=progress conv=fsync`

#### img to SDCard
- [ ] `dd if=sdimage.img of=/dev/sdX bs=4M status=progress conv=fsync`

### User Settings
- [ ] `sudo su root`
- [ ] `passwd`
- [ ] `adduser user`
- [ ] `echo "user  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/user`
- [ ] `reboot`

### 64Bit
- [ ] `rpi-update`
```
/boot/config.txt - [pi4]
arm_64bit=1
```
- [ ] `reboot`

### Base Apps Install
- [ ] `sudo apt-get update`
- [ ] `sudo apt-get upgrade`
- [ ] `sudo apt-get install kde-plasma-desktop plasma-nm latte-dock chromium`

### NM Settings
- [ ] `echo "nohook wpa_supplicant" >> /etc/dhcpcd.conf`

### PostInstall Settings
```
THEME
System Settings >>> Workspace Theme >>> Look And Feel >>> Breeze Dark >>> Apply
```

```
FONTS
System Settings >>> Fonts >>> Adjust All Fonts >>> Font style = Bold >>> Size = 12 >>> OK
```

```
BORDERS
System Settings >>> Application Style >>> Window Decorations >>> Border Size = No Borders
```

```
WINDOWS PLACEMENT
System Settings >>> Window Management >>> Window Behavior >>> Advanced >>> Placement >>> Centered
```

```
SCREEN SCALE
System Settings >>> Display and Monitor >>> Scale Display >>> Scale = 1.2 >>> OK
```

```
KEYBOARD
System Settings >>> Input Devices >>> Keyboard >>> Layouts >>> Configure Layouts >>> Add >>> Layout = Turkish >>> Variant = Turkish (intl., with dead keys) >>> OK
Map >>> tr >>> Move Up
```

```
KDE WALLET
Wallet Management Tool >>> Settings >>> Configure Wallet >>> Enable the KDE wallet subsystem
```

```
```

- [ ] `kwriteconfig5`
