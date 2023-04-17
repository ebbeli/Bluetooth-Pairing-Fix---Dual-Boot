# Script to fix dual boot pairing problem with headphones

Script for finding bluetooth key for dual boot machine with Linux & Windows.

Find adapters BT-key for windows and use it with Linux.

Pairing problems cause is same adapter and device, but different OS/software.

Works with Bluetooth headphones. Not sure about anything else.

Automated from : https://wiki.archlinux.org/index.php/Bluetooth#Dual_boot_pairing

## 1. Prerequisites/Depencies

Install **chntpw**, a registry editor

`sudo apt install chntpw`
`sudo dnf install chntpw`
`sudo yum install chntpw`

## 2. How to use

bash bt_key.sh

1. Boot to Linux. Pair BT-Headphones in Linux. Shutdown.
2. Boot to Windows. Pair BT-Headphones. Shutdown.
3. Boot to Linux again. DON'T TOUCH BLUETOOTH SETTINGS.
4. Run Script and follow instructions.

5. After copying BT-key. Run MACs.sh if you dont know your bt-adapter's and headphone's MAC:s.

6. Open terminal and sudo su

7. cd var/lib/bluetooth/XX\:XX\:XX\:XX\:XX\:XX (adapters MAC and insert \ before :)

8. cd XX\:XX\:XX\:XX\:XX (Device MAC. Insert \:s)

9. There replace Key value under [LinkKey] with your BT-key. Remove spaces.

10. Restart Bluetooth and your headphones should connect.

## Ps. I'm making second script for replacing the key, when I have time. Leave comment if something isn't working.
