#!/bin/bash

echo 'Looking for Raspbery IP addresses ...'

# arp-scan -l | sort -V | grep -B1 -F '(DUP: '
arp-scan --localnet | grep -Pi "\s(b8:27:eb:|dc:a6:32:)"

# invert return code (grep returns 0 when it finds a match)
if [[ ! "$?" -eq "0" ]]; then
	echo 'No Raspberry Pi found!'
	exit 0
fi
