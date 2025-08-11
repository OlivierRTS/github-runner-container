#!/bin/bash

SHARE="${SMB_SHARE}"
MOUNTPOINT="/mnt/share"
USERNAME="${SMB_USER}"
PASSWORD="${SMB_PASS}"
DOMAIN="${SMB_DOMAIN}"

mount -t cifs "$SHARE" "$MOUNTPOINT" -o username="$USERNAME",password="$PASSWORD",domain="$DOMAIN",vers=3.0

exec tail -f /dev/null
