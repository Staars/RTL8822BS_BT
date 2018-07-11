#!/bin/bash
#
# Shell script to install Bluetooth firmware and attach BT part of
# RTL8822BS for Z28pro 2/16
# based on the work of lwfinger


if [ "$1" = "" ]
then
    # Find the TTY attached to the BT device
    TTYSTRING=`dmesg -t | grep tty | grep MMIO | cut -b 18-22`
    TTY=`expr substr "$TTYSTRING" 1 5`

    if [ "$TTYSTRING" = "" ]
    then
	echo
	echo "No BT TTY device has been found"
	echo "This is probably a problem with your DTS"
	echo "Please check by hand"
	echo "dmesg -t | grep tty"
	echo
	exit 1
    fi
else
    # Use the TTY device mentioned oi the call
    TTY=$1
fi

TTY="/dev/$TTY"
echo "Using device $TTY for Bluetooth"

echo "We must stop getty now, You will lose your external serial console!"

systemctl stop serial-getty@$TTY
sleep 2

echo "Power cycle 8822BS BT-section"
rfkill block bluetooth
sleep 2
rfkill unblock bluetooth
echo "Start attaching"

./8822b_hciattach -n -s 115200 $TTY rtk_h5 2>&1 &

