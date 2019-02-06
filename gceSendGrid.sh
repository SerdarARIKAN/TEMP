##################################################

# nano /etc/postfix/main.cf
# #default_transport = error
# #relay_transport = error
# relayhost = smtp.sendgrid.net:2525
# smtp_tls_security_level = encrypt
# smtp_sasl_auth_enable = yes
# smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
# header_size_limit = 4096000
# smtp_sasl_security_options = noanonymous

##################################################

echo smtp.sendgrid.net:2525 YOUR_SMTP_LOGIN:YOUR_SMTP_PASSWORD >> /etc/postfix/sasl_passwd
echo smtp.sendgrid.net:2525 apikey:YOUR_API_KEY >> /etc/postfix/sasl_passwd

##################################################

postmap /etc/postfix/sasl_passwd

##################################################

ls -l /etc/postfix/sasl_passwd*
rm /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd.db
ls -la /etc/postfix/sasl_passwd.db
/etc/init.d/postfix restart

##################################################

apt-get install mailutils -y
echo '[MESSAGE]' | mail -s [SUBJECT] [EMAIL@EXAMPLE.COM]
tail -n 5 /var/log/syslog

##################################################
