#!/bin/bash

icon="/home/libor/.dotfiles/icons/onedrive.png"
title=" Připojeno k OneDrive"

rclone --vfs-cache-mode writes mount OneDrive: /home/libor/Public/OneDrive &
notify-send -t 1000 -i $icon "$title" 
