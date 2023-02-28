#! /bin/sh

echo " _____ _   _ ____  ___ _   _  ____   ____  ___   ___  "
echo "|_   _| | | |  _ \|_ _| \ | |/ ___| |  _ \|_ _| |_  \ "
echo "  | | | | | | |_) || ||  \| | |  _  | |_) || |    ) | "
echo "  | | | |_| |  _ < | || |\  | |_| | |  _ / | |   / /  "
echo "  |_|  \___/|_| \_|___|_| \_|\____| |_|   |___| |___| "
echo "Community Updates by DhanOS, version: 0.1.0"

bmc &
mount /dev/mmcblk0p1 /mnt/sdcard/
echo 3 4 1 7 > /proc/sys/kernel/printk
/etc/test_ping.sh &
