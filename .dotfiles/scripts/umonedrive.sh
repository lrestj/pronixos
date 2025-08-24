#!/bin/bash

icon="/home/libor/.dotfiles/icons/onedrive.png"
title=" OneDrive odpojen"

umount /home/libor/Public/OneDrive
notify-send -t 2000 -i $icon "$title" 
