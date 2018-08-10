# sudo su root
# passwd

# sed -i "s#PermitRootLogin no#PermitRootLogin yes#g" "/etc/ssh/sshd_config"
# sed -i "s#PasswordAuthentication no#PasswordAuthentication yes#g" "/etc/ssh/sshd_config"
# sed -i "s#ChallengeResponseAuthentication no#ChallengeResponseAuthentication yes#g" "/etc/ssh/sshd_config"

# /etc/init.d/ssh reload

lsblk
# mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
mkdir -p /mnt/sd/b
mount -o discard,defaults /dev/sdb /mnt/sd/b
chmod a+w /mnt/sd/b
cp /etc/fstab /etc/fstab.backup
blkid /dev/sdb
echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /mnt/sd/b ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab
# cat /etc/fstab
# cd /mnt/sd/b

apt-get update
apt-get upgrade
apt-get install python3-pip libapache2-mod-wsgi-py3 curl wget apt-transport-https dirmngr dnsutils default-libmysqlclient-dev git

wget http://software.virtualmin.com/gpl/scripts/install.sh; /bin/sh install.sh

a2enmod wsgi
systemctl restart apache2

pip3 install virtualenv

mkdir /mnt/sd/b/mysql/
rsync -av /var/lib/mysql /mnt/sd/b
sed -i "s#datadir\t\t= /var/lib/mysql#datadir\t\t= /mnt/sd/mysql#g" "/etc/mysql/mariadb.conf.d/50-server.cnf"

#innodb_data_file_path = ibdata1:10M:autoextend:max:512M

sed -i "/^bind-address/d" "/etc/mysql/mariadb.conf.d/50-server.cnf"

systemctl restart mysql

mysql -u <root> -p -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Pi314159276' WITH GRANT OPTION;"

# mysql --user=root --database=cautolog --password=Pi314159276 < /mnt/sd/b/tecdoc2017q2/tecdoc.sql
# mysql --user=root --database=cautolog --password=Pi314159276 < "SET GLOBAL connect_timeout=600;"
# mysql --user=root --database=cautolog --password=Pi314159276 < "SET GLOBAL interactive_timeout=60;"


# nohup command &
# ps aux
