#!/bin/bash

icon="/home/libor/.dotfiles/icons/onedrive.png"
title="✔ Připojeno"

rclone --vfs-cache-mode writes mount OneDrive: /home/libor/Public/OneDrive &
notify-send -t 2000 -i $icon -c min "$title" 
