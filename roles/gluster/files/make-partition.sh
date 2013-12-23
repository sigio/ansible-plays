#!/bin/sh

DISK=$1

/sbin/parted --script /dev/$DISK "mklabel gpt"

echo "n
1



w
y
q
" | /sbin/gdisk /dev/$DISK


