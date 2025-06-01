#!/bin/sh


# Replace {touchpad_device_name} with the actual name of your touchpad
touchpad_device_name="synps/2-synaptics-touchpad"

#Function to disable touchpad
disable_touchpad() {
  hyprctl keyword device[${touchpad_device_name}]:enabled false
  echo "Touchpad zakázán"
}

# Function to enable touchpad
enable_touchpad() {
  hyprctl keyword device[${touchpad_device_name}]:enabled true
  echo "Touchpad aktivní"
}

# Ask user
echo "Aktivovat/zakázat touchpad [a,z] ???"
read -n 1 -s input
 if [ $input = "z" ]; then
  disable_touchpad
 else
   enable_touchpad
 fi

sleep 1 
