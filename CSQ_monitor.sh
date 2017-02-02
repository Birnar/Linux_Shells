#! /bin/bash


#------------------------------------------------
# All copyright @ https://github.com/Birnar     |
# Twitter @eng-birnar                           |
#------------------------------------------------


# Check User is root
if [ "$(whoami)" != 'root' ]; then
        echo "You have no permission to run $0 as non-root user."
        exit 1;
fi

Loop () {
# Output of CSQ
cat /dev/$device_name | grep +CSQ &
# Send AT command to get the signal
echo AT+CSQ > /dev/$device_name
sleep 1s
# For looping
Loop
}

echo "Devices List:"
echo
#!/bin/bash

for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev); do
    (
        syspath="${sysdevpath%/dev}"
        devname="$(udevadm info -q name -p $syspath)"
        [[ "$devname" == "bus/"* ]] && continue
        eval "$(udevadm info -q property --export -p $syspath)"
        [[ -z "$ID_SERIAL" ]] && continue
        echo "/dev/$devname - $ID_SERIAL"
    )
done

# Main menu
echo 'Kindly type device name:'
read device_name
Loop
