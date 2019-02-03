sudo su root
passwd

sed -i "s#PermitRootLogin no#PermitRootLogin yes#g" "/etc/ssh/sshd_config"
sed -i "s#PasswordAuthentication no#PasswordAuthentication yes#g" "/etc/ssh/sshd_config"
sed -i "s#ChallengeResponseAuthentication no#ChallengeResponseAuthentication yes#g" "/etc/ssh/sshd_config"

/etc/init.d/ssh reload
