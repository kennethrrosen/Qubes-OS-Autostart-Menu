#!/bin/bash

declare -a work_qubes=("work-vm1" "work-vm2" "work-vm3")
declare -a system_qubes=("sys-net" "sys-firewall" "sys-usb" "sys-vpn")
declare -a admin_qube=("admin-vm1" "admin-vm2")
declare -a comms_qube=("comms-vm1" "comms-vm2")

start_qubes() {
  qubes_to_start=("${!1}")

  for qube in "${qubes_to_start[@]}"; do
    echo "Starting $qube..."
    qvm-start "$qube" || echo "Failed to start $qube"
  done
}

prompt_user() {
  startup_choice=$(zenity --list --radiolist --height 200 --width 250 --title="Select Startup Group" --text "Choose a group of qubes to start:" --column "Pick" --column "Startup Group" TRUE "Work Qubes" FALSE "System Qubes" FALSE "Admin Qube" FALSE "Comms Qube")

  case "$startup_choice" in
    "Work Qubes")
      echo "Starting work qubes..."
      start_qubes work_qubes[@]
      ;;
    "System Qubes")
      echo "Starting system qubes..."
      start_qubes system_qubes[@]
      ;;
    "Admin Qube")
      echo "Starting admin qubes..."
      start_qubes admin_qube[@]
      ;;
    "Comms Qube")
      echo "Starting comms_kick..."
      start_qubes comms_qube[@]
      ;;
    *)
      echo "No option selected. Exiting."
      ;;
  esac
}

echo "QubesOS autostart script initialized"
prompt_user
