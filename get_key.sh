#!bin/bash/
echo "1.Mount your Windows partition using disks tool and pair your BT-device first in Linux/GNU and after that in Windows. Don't pair or unpair after that. Continue if ready.."

read

a=$(bluetoothctl list | sed 's/://g')
b=${a:11:12}
adapter=$(echo $b | tr '[:upper:]' '[:lower:]')

#!bin/bash/
mapfile -t devices < <( bluetoothctl devices )
 
 echo "Choose your bluetooth device from the list:"
select choice in "${devices[@]}"; do
  [[ -n $choice ]] || { echo "Invalid choice. Please try again." >&2; continue; }
  break # valid choice was made; exit prompt.
done

vardevice=$(echo $choice | grep -oE '([ :][[:xdigit:]]{2}){6}')


device=$(echo $vardevice | sed 's/://g' | tr '[:upper:]' '[:lower:]')

echo "$device"


mkdir disk


lsblk
 
 echo "3.Recognize your Windows partition by size. Then write or copy its logical address (MOUNTPOINT) exactly how it is and press enter:"

 read vardisk
 
 echo $vardisk 
address=$vardisk/Windows/System32/config/

 cd $address

btAddr="cd ControlSet001\Services\BTHPORT\Parameters\Key"\\"$adapter"\\

clear


echo "6. You will get two commands to use after this step. Paste commands in given order after _SEVENTH STEP_. After that you will see something like:"
echo "Value <e8d03c148708> of type REG_BINARY (3), data length 16 [0x10]
:00000  F0 31 8F 05 AB 37 0D D9 AB 76 2B 4C 6F FF 7A AC .1...7...v+Lo.z."

echo ""
echo "6.1 Copy the Bluetooth pairing key:( F0 31 8F 05 AB 37 0D D9 AB 76 2B 4C 6F FF 7A AC ), It's HEX binary code with 16 pairs of random letters and numbers."

read

echo "6.2:  $btAddr"
echo ""
read
echo "6.3:  hex $device"
echo ""
read
echo "7. Copy/Paste or write commands 6.2 and 6.3 at given order in the next prompt. After second command follow previous step to copy the right value. After copying it, press Ctrl+C to exit and follow directions on README.md to configure Linux to use it."

read

chntpw -e SYSTEM