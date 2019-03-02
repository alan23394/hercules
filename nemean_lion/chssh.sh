#!/bin/sh

PORT_STATUS=$(grep '^Port [[:digit:]][[:digit:]][[:digit:]][[:digit:]]$' /etc/ssh/sshd_config)

if [ -n "$PORT_STATUS" ]; then
	su -c 'sed -i.bak "s/^Port [[:digit:]][[:digit:]][[:digit:]][[:digit:]]$/Port 2397/" /etc/ssh/sshd_config && systemctl restart ssh'
else
	su -c 'echo "Port 2397" >> /etc/ssh/sshd_config && systemctl restart ssh'
fi

