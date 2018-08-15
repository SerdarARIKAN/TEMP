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
apt-get install python3-pip libapache2-mod-wsgi-py3 curl wget apt-transport-https dirmngr dnsutils default-libmysqlclient-dev git

##################################################

wget http://software.virtualmin.com/gpl/scripts/install.sh; /bin/sh install.sh

a2enmod wsgi
systemctl restart apache2

##################################################

pip3 install virtualenv

##################################################

/etc/mysql/mariadb.conf.d/50-server.cnf
[mysqld]

# bind-address    = 127.0.0.1

innodb_read_io_threads = 4
innodb_write_io_threads = 4

connect_timeout = 31536000
interactive_timeout = 31536000

tmp_table_size = 18446744073709551615
max_heap_table_size = 18446744073709551615

innodb_buffer_pool_size = 4294967296
innodb_data_file_path = ibdata1:3221225472:autoextend

##################################################

SHOW VARIABLES like 'innodb_read_io_threads';
SHOW VARIABLES like 'innodb_write_io_threads';

SHOW VARIABLES like 'connect_timeout';
SHOW VARIABLES like 'interactive_timeout';

SHOW VARIABLES like 'tmp_table_size';
SHOW VARIABLES like 'max_heap_table_size';

SHOW VARIABLES like 'innodb_buffer_pool_size';
SHOW VARIABLES like 'innodb_data_file_path';

SHOW STATUS

##################################################

mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '********' WITH GRANT OPTION;"

##################################################

mkdir /mnt/sd/b/mysql/
rsync -av /var/lib/mysql /mnt/sd/b

/etc/mysql/mariadb.conf.d/50-server.cnf
[mysqld]

datadir   = /mnt/sd/b/mysql

##################################################

systemctl restart mysql

##################################################

nohup mysql --user=root --database=cautolog --password=******** < /mnt/sd/b/tecdoc2017q2/tecdoc.sql &
ps aux

##################################################
