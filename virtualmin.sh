##################################################

apt-get update
apt-get upgrade
apt-get install apt-transport-https dirmngr git curl wget htop dnsutils libapache2-mod-wsgi-py3 python3-pip default-libmysqlclient-dev

##################################################

wget http://software.virtualmin.com/gpl/scripts/install.sh; /bin/sh install.sh

##################################################

a2enmod wsgi
systemctl restart apache2

##################################################

pip3 install virtualenv

##################################################
