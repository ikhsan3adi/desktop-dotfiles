#!/bin/sh

# This script toggles the bluetooth on and off using bluetoothctl
if bluetoothctl show | grep -q "Powered: yes"; then
    bluetoothctl power off
else
    bluetoothctl power on
fi