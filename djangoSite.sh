#!/bin/bash
clear
echo -e      "\e[0;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;33m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;34m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;35m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;36m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         "Creat and Configure Django Project for Virtualmin."
echo         ""
echo -e      "\e[0;36m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;35m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;34m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;33m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "FQDN              : N A M E.TDL"
echo         "                    example.com"
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
# sleep 2.5
read -p      "NAME              : " name
echo         ""
read -p      "TDL               : " tdl
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Deleting existing project..."
echo         ""
echo         ""
rm   -rf     "/home/$name/public_html/websites/${name}.${tdl}/"
echo         ""
echo         ""
# sleep 2.5
echo         "Deleted existing project..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Git Cloning..."
echo         ""
git  clone   "https://github.com/SerdarARIKAN/${name}_${tdl}" "/home/$name/public_html/websites/${name}.${tdl}"
echo         ""
# sleep 2.5
echo         "Git Clone..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Creating VENV..."
echo         ""
python3      "/usr/local/lib/python3.5/dist-packages/virtualenv.py" "/home/$name/public_html/websites/${name}.${tdl}/VENV"
echo         ""
# sleep 2.5
echo         "Created VENV..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Activating VENV..."
echo         ""
source       "/home/$name/public_html/websites/$name.$tdl/VENV/bin/activate"
echo         ""
# sleep 2.5
echo         "Activated VENV..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Installing Requirements..."
echo         ""
pip3         install -r /home/$name/public_html/websites/$name.$tdl/requirements.txt
echo         ""
# sleep 2.5
echo         ""
echo         "Installed Requirements..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Editing settings.py..."
echo         ""
sed  -i      "s#DEBUG = True#DEBUG = False#g" "/home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/settings.py"
sed  -i      "s#ALLOWED_HOSTS = \[\]#ALLOWED_HOSTS = ['*']#g" "/home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/settings.py"
sed  -i      "s#LANGUAGE_CODE = 'en-us'#LANGUAGE_CODE = 'tr-TR'#g" "/home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/settings.py"
sed  -i      "s#TIME_ZONE = 'UTC'#TIME_ZONE = 'Asia\/Istanbul'#g" "/home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/settings.py"
sed  -i      "s#STATICFILES_DIRS = (os.path.join(BASE_DIR, 'static'),)#STATIC_ROOT = os.path.join(BASE_DIR, 'static')#g" "/home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/settings.py"
sed  -i      "#urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)#d" "/home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/urls.py"
echo         ""
# sleep 2.5
echo         "Edited settings.py..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Making Migrations..."
echo         ""
python3      "/home/$name/public_html/websites/$name.$tdl/manage.py" "makemigrations"
echo         ""
# sleep 2.5
echo         "Maked Migrations..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Migrating..."
echo         ""
python3      "/home/$name/public_html/websites/$name.$tdl/manage.py" "migrate"
echo         ""
# sleep 2.5
echo         "Migrated..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Creating Super User..."
echo         ""
python3      "/home/$name/public_html/websites/$name.$tdl/manage.py" "createsuperuser"
echo         ""
# sleep 2.5
echo         "Created Super User..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Collecting Static..."
echo         ""
python3      "/home/$name/public_html/websites/$name.$tdl/manage.py" "collectstatic"
echo         ""
# sleep 2.5
echo         "Collected Static..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Configuring BIND settings..."
echo         ""
echo         "\$ttl	38400" > "/var/lib/bind/$name.$tdl.hosts"
echo         "@	IN	SOA	ns1.$name.$tdl. root.ns1.$name.$tdl. (" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "			$(date +%s)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "			10800" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "			3600" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "			604800" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "			38400 )" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "@	IN	NS	ns1.$name.$tdl." >> "/var/lib/bind/$name.$tdl.hosts"
echo         "@	IN	NS	ns2.$name.$tdl." >> "/var/lib/bind/$name.$tdl.hosts"
echo         "ns1.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "ns2.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "www.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "ftp.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "m.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "localhost.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "webmail.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "admin.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "mail.$name.$tdl.	IN	A	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "$name.$tdl.	IN	MX	5	$(dig +short myip.opendns.com @resolver1.opendns.com)" >> "/var/lib/bind/$name.$tdl.hosts"
echo         "$name.$tdl.	IN	TXT	\"v=spf1 a mx a:$name.$tdl ip4:$(dig +short myip.opendns.com @resolver1.opendns.com) ip4:$(dig +short myip.opendns.com @resolver1.opendns.com) ?all\"" >> "/var/lib/bind/$name.$tdl.hosts"
echo         ""
# sleep 2.5
echo         "Configured BIND settings..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Configuring Apache settings..."
echo         ""
echo         "<VirtualHost $(hostname -I | cut -d' ' -f1):80>" > "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerName $name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerAlias www.$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerAlias webmail.$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerAlias admin.$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "DocumentRoot /home/$name/public_html/websites/$name.$tdl/" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ErrorLog /var/log/virtualmin/$name.$tdl_error_log" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "CustomLog /var/log/virtualmin/$name.$tdl_access_log combined" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "WSGIProcessGroup $name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "WSGIDaemonProcess $name.$tdl python-home=/home/$name/public_html/websites/$name.$tdl/VENV python-path=/home/$name/public_html/websites/$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "WSGIScriptAlias / /home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/wsgi.py process-group=$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Directory /home/$name/public_html/websites/$name.$tdl/${name}_${tdl}>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Files wsgi.py>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Require all granted" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Files>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Directory>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /robots.txt /home/$name/public_html/websites/$name.$tdl/static/robots.txt" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /favicon.ico /home/$name/public_html/websites/$name.$tdl/static/favicon.ico" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /static/ /home/$name/public_html/websites/$name.$tdl/static/" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Directory /home/$name/public_html/websites/$name.$tdl/static>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Require all granted" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Directory>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /media/ /home/$name/public_html/websites/$name.$tdl/media/" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Directory /home/$name/public_html/websites/$name.$tdl/media>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Require all granted" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Directory>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</VirtualHost>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         ""
echo         "<VirtualHost $(hostname -I | cut -d' ' -f1):443>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerName $name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerAlias www.$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerAlias webmail.$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ServerAlias admin.$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "DocumentRoot /home/$name/public_html/websites/$name.$tdl/" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "ErrorLog /var/log/virtualmin/$name.$tdl_error_log" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "CustomLog /var/log/virtualmin/$name.$tdl_access_log combined" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "WSGIProcessGroup ssl_$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "WSGIDaemonProcess ssl_$name.$tdl python-home=/home/$name/public_html/websites/$name.$tdl/VENV python-path=/home/$name/public_html/websites/$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "WSGIScriptAlias / /home/$name/public_html/websites/$name.$tdl/${name}_${tdl}/wsgi.py process-group=ssl_$name.$tdl" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Directory /home/$name/public_html/websites/$name.$tdl/${name}_${tdl}>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Files wsgi.py>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Require all granted" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Files>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Directory>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /robots.txt /home/$name/public_html/websites/$name.$tdl/static/robots.txt" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /favicon.ico /home/$name/public_html/websites/$name.$tdl/static/favicon.ico" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /static/ /home/$name/public_html/websites/$name.$tdl/static/" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Directory /home/$name/public_html/websites/$name.$tdl/static>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Require all granted" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Directory>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Alias /media/ /home/$name/public_html/websites/$name.$tdl/media/" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "<Directory /home/$name/public_html/websites/$name.$tdl/media>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "Require all granted" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</Directory>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "SSLEngine on" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "SSLCertificateFile /home/$name/ssl.cert" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "SSLCertificateKeyFile /home/$name/ssl.key" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "SSLProtocol all -SSLv2 -SSLv3 -TLSv1 -TLSv1.1" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         "</VirtualHost>" >> "/etc/apache2/sites-available/$name.$tdl.conf"
echo         ""
# sleep 2.5
echo         "Configured Apache settings..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Configuring Permissions..."
echo         ""
chmod        -R 3777 /home/$name/public_html/websites/$name.$tdl
chown        -R $name:$name /home/$name/public_html/websites/$name.$tdl
echo         ""
# sleep 2.5
echo         "Configured Permissions..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo         "Restarting Services..."
echo         ""
service      apache2 restart
service      bind9 restart
echo         ""
# sleep 2.5
echo         "Restarted Services..."
echo         ""
echo         ""
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         ""
echo -e      "\e[0;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;33m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;34m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;35m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;36m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo         ""
echo         "     M I S S I O N S        C O M P L E T E D     "
echo         ""
echo         "Don't Forget  L e t ’ s    E n c r y p t  Settings"
echo         ""
echo -e      "\e[0;36m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;35m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;34m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;33m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;32m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
echo -e      "\e[0;31m!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\e[0m"
