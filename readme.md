Script for finding bluetooth key for dual boot machine with Linux & Windows.

Works with Bluetooth headphones. Not sure about anything else.

Automated from from: https://wiki.archlinux.org/index.php/Bluetooth#Dual_boot_pairing

## 1. Prerequisites/Depencies

Install **chntpw**, a registry editor

`sudo apt install chntpw`
`sudo dnf install chntpw`
`sudo yum install chntpw`

## 2. How to uuse

bash bt_key.sh

1. Boot to Linux. Pair BT-Headphones in Linux. Shutdown.
2. Boot to Windows. Pair BT-Headphones. Shutdown.
3. Boot to Linux again. DON'T TOUCH BLUETOOTH SETTINGS.
4. Run Script and follow instructions.

5. After copying BT-key. Run MACs.sh if you dont know your bt-adapter's MAC and headphones mac.

6. sudo su

7. cd var/lib/bluetooth/XX\:XX\:XX\:XX\:XX\:XX (adapters MAC and insert \ before :)

8.cd XX\:XX\:XX\:XX\:XX (Device MAC. Insert \:s)

9. There replace Key value under [LinkKey] with your BT-key. Remove spaces.

10. Restart Bluetooth and your headphones should connect.

## Ps. I'm making second script for replacing the key, when I have time. Leave comment if something isn't working.
