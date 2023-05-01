# Shell-script for fixing dual boot machine's pairing problem with bluetooth headphones

Script for configuring bluetooth pairing key as same with both operating systems in dual boot machine. (Linux & Windows)

Cause of problem is simple, after pairing device and adapter tries to use one stored key when reconnecting with familiar MAC-addresses. In dual boot both operating systems use own pairing keys, but have same MAC-addresses due shared hardware. Which causes misconfiguration when you try to reconnect paired bluetooth device after switching between operating systems.

Script finds device's pairing key from Window's partition so you can configure your GNU/Linux-OS with it. Tested & works with bluetooth headphones. Not sure about anything else.

Based on: https://wiki.archlinux.org/index.php/Bluetooth#Dual_boot_pairing

## 1. Prerequisites / dependencies

Install **chntpw**, a registry editor

`sudo apt install chntpw`
`sudo dnf install chntpw`
`sudo yum install chntpw`

## 2. How to use

1. Boot to Linux. Pair BT-Headphones in Linux. Shutdown.

2. Boot to Windows. Pair BT-Headphones. Shutdown.

3. Boot to Linux again. DON'T TOUCH BLUETOOTH SETTINGS.

4. Open terminal, run script and follow instructions.

- `$ bash bt_key.sh`

5. After completion. Run MACs.sh if you dont know your bt-adapter's and headphone's MAC:s.

- `$ bash MAC.sh`

6. Open another terminal as root and enter commands.

- `$ sudo su`

- `$ cd var/lib/bluetooth/XX\:XX\:XX\:XX\:XX\:XX` (Adapters MAC. Insert "\\" before each ":" )

- `$ cd XX\:XX\:XX\:XX\:XX` (Device MAC.)

7. Open info file from current folder andreplace Key value under [LinkKey] with your extracted bluetooth key. Remove spaces.

- `$ nano info`

8. Restart Bluetooth and your headphones should connect.

#### Ps. I'm making second script for replacing the key, when I have time.
