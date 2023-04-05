# Qubes-OS-Autostart-Menu
Qubes OS Autostart Menu

By not autostarting any qubes on boot, you can maintain a leaner and faster startup.

This guide will help you create an autostart script for Qubes OS using Zenity in dom0. The script will allow you to select which group of qubes to start upon system startup. We'll create a .desktop file and a .sh script in the ~/.config/autostart/ folder. If you don't have an autostart folder or Zenity installed, we'll guide you through the installation process.

### Step 1: Install Zenity

To install Zenity, open a terminal in dom0 and run the following command:
 ```
 sudo qubes-dom0-update zenity
 ```
### Step 2: Create the autostart folder

If you don't have a ~/.config/autostart/ folder, create it by running the following command in dom0:
```
mkdir -p ~/.config/autostart
```
### Step 3: Edit the .desktop and .sh files

Clone or download this repository to an AppVM (replace your_appvm with the name of your AppVM):
```
[user@your_appvm ~]$ git clone https://github.com/yourusername/qubes-autostart-menu.git
```
Edit the qubes-autostart-menu.desktop file in the repository and replace user with your username:
```
Exec=/home/user/.config/autostart/autostart.sh
```
Edit the autostart.sh script in the repository to replace the qube names with your own qubes:
```
declare -a work_qubes=("work-vm1" "work-vm2" "work-vm3")
declare -a system_qubes=("sys-net" "sys-firewall" "sys-usb" "sys-vpn")
declare -a admin_qube=("admin-vm1" "admin-vm2")
declare -a comms_qube=("comms-vm1" "comms-vm2")
```
### Step 4: Copy the .desktop and .sh files to dom0

In dom0, run the following command to copy the modified qubes-autostart-menu.desktop file from your AppVM to the dom0 ~/.config/autostart/ folder:
```
qvm-run --pass-io your_appvm 'cat /path/to/qubes-autostart-menu/qubes-autostart-menu.desktop' > ~/.config/autostart/qubes-autostart-menu.desktop
```
Similarly, copy the modified autostart.sh file from your AppVM to the dom0 ~/.config/autostart/ folder:
```
qvm-run --pass-io your_appvm 'cat /path/to/qubes-autostart-menu/autostart.sh' > ~/.config/autostart/autostart.sh
```
Replace your_appvm with the name of your AppVM, and /path/to/qubes-autostart-menu with the actual path to the folder containing the qubes-autostart-menu.desktop and autostart.sh files in your AppVM.

In dom0, run the following command to move the received files to the ~/.config/autostart/ folder:
```
mv ~/QubesIncoming/your_appvm/qubes-autostart-menu.desktop ~/.config/autostart/
mv ~/QubesIncoming/your_appvm/autostart.sh ~/.config/autostart/
```
Replace your_appvm with the name of your AppVM.

### Step 5: Make the script executable

Run the following command in dom0 to make the script executable:
```
chmod +x ~/.config/autostart/autostart.sh
```
That's it! The Qubes OS Autostart Menu will now appear during system startup, allowing you to choose which group of qubes to start.
