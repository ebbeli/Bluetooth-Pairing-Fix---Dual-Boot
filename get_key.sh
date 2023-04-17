#!bin/bash/
echo "1.Pair your BT-device first in Linux/GNU and after that in Windows. Don't pair or unpair after that. Continue if ready.."

read

a=$(bluetoothctl list | sed 's/://g')
echo "$a"
b=${a:11:12}
adapter=$(echo $b | tr '[:upper:]' '[:lower:]')

bluetoothctl devices
 
 echo "2.Choose your bluetooth device from the list and write/copy its MAC-address (XX:XX:XX:XX:XX:XX) to continue:"

 read vardevice

device=$(echo $vardevice | sed 's/://g' | tr '[:upper:]' '[:lower:]')

echo "$device"

lsblk
 
 echo "3.Recognize your Windows partition by size. Then write or copy its logical address (MOUNTPOINT) exactly how it is and press enter:"

 read vardisk
 
 echo $vardisk 
address=$vardisk/Windows/System32/config

 cd $address

btAddr="cd ControlSet001\Services\BTHPORT\Parameters\Key"\\"$adapter"\\"$device"

clear

echo "$btAddr"

echo "4.Copy command from above and press enter" \ && 

read
echo "5. After using the command after this you will see something like: Value <104fa875c82e> of type REG_BINARY (3), data length 16 [0x10]
:00000  54 80 E3 E3 01 49 3A E3 E4 8C 5A 74 18 E8 25 54 T....I:...Zt..%T"

read

echo "6. Copy the Bluetooth pairing key:(54 80 E3 E3 01 49 3A E3 E4 8C 5A 74 18 E8 25 54), it's random letter and number in pairs"

read

chntpw -e SYSTEM
