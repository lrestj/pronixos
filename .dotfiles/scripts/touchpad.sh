#!/bin/bash


# Replace {touchpad_device_name} with the actual name of your touchpad
touchpad_device_name="synps/2-synaptics-touchpad"

# Function to disable touchpad
disable_touchpad() {
  hyprctl keyword device[${touchpad_device_name}]:enabled false
  echo "Touchpad zakázán"
}

# Function to enable touchpad
enable_touchpad() {
  hyprctl keyword device[${touchpad_device_name}]:enabled true
  echo "Touchpad povolen"
}

# Check if mouse is connected
mouse_connected=$(hyprctl devices | grep -c "genius-wireless-device-1")

# If mouse is connected, disable touchpad
if [ "$mouse_connected" -gt 0 ]; then
  disable_touchpad
else
  enable_touchpad
fi
