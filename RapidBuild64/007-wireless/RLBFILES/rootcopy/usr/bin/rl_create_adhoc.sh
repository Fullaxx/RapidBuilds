#!/bin/bash

if [ "$#" != "3" ]; then
  echo "$0 <dev> <essid> <ip> <channel>"
  exit 1
fi

DEV="wlan0"
ESSID="ADHOCNET"
IPADDR="172.16.1.1/24"
CHAN="1"

iwconfig "$DEV" mode ad-hoc
# iw dev "$DEV" set type ibss
# iw dev <devname> ibss join <SSID> <freq in MHz> - test this

iwconfig "$DEV" essid "$ESSID"

iwconfig "$DEV" channel "$CHAN"
# iw dev "$DEV" set channel "$CHAN"

ifconfig "$DEV" "$IPADDR"
