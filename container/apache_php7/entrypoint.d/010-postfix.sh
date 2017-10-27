#!/usr/bin/env bash
set -e

# use hostname for mailer domain
hostname_line=$(tail -n1 /etc/hosts)
hostname_final=$(echo $hostname_line | awk '{print $2}')
postconf -e "myhostname = $hostname_final"
postconf -e "myorigin = $hostname_final"

service postfix restart > /dev/null 2>&1

