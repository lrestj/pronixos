#!/bin/bash

icon="/home/libor/.dotfiles/icons/googledrive.png"
title="❌ Odpojeno"

umount /home/libor/Public/GoogleDrive
notify-send -t 2000 -c min -i $icon "$title" 
