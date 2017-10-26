#!/bin/sh

hostname_line=$(tail -n1 /etc/hosts)
hostname_final=$(echo $hostname_line | awk '{print $2}')

postconf -e "myhostname = $hostname_final"
postconf -e "myorigin = $hostname_final"

/etc/init.d/postfix restart

#CMD ["apache2-foreground"]
/usr/sbin/apache2ctl -D FOREGROUND