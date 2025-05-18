#!/bin/sh

# This script toggles the wifi on and off using nmcli
status=$(nmcli radio wifi)

if [ "$status" = "enabled" ]; then
  nmcli radio wifi off
else
  nmcli radio wifi on
fi
