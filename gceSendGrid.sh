##################################################

# nano /etc/postfix/main.cf
relayhost = smtp.sendgrid.net:2525
smtp_tls_security_level = dane
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
header_size_limit = 4096000
smtp_sasl_security_options = noanonymous
message_size_limit = 1024000000
smtpd_tls_CAfile = /etc/postfix/postfix.ca.pem
smtpd_tls_security_level = may

##################################################

echo smtp.sendgrid.net:2525 apikey:SG.YOUR_API_KEY >> /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
ls -l /etc/postfix/sasl_passwd*
rm /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd.db
ls -la /etc/postfix/sasl_passwd.db
/etc/init.d/postfix restart

##################################################

# /etc/php/7.0/apache2/php.ini
upload_max_filesize = 1024M
post_max_size = 1024M

##################################################

# /home/user-name/etc/php7.0/php.ini
upload_max_filesize = 1024M
post_max_size = 1024M

##################################################
