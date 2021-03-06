##################################################

# lsblk

##################################################

# mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb

##################################################

mkdir -p /mnt/sd/b
mount -o discard,defaults /dev/sdb /mnt/sd/b
chmod a+w /mnt/sd/b

##################################################

# cp /etc/fstab /etc/fstab.backup
# blkid /dev/sdb

##################################################

echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /mnt/sd/b ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab
# cat /etc/fstab

##################################################

# cd /mnt/sd/b

##################################################
