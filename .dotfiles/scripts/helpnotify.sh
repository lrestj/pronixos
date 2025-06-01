#!/bin/bash

icon="/home/libor/.dotfiles/icons/help.png"
title=" Nápověda klávesové zkratky:"
line1="\n Zavřít aktivní okno: +Q"
line2="\nOkno na celou obrazovku a zpět: +F"
line3="\nMenu aplikací:  "
line4="\nMenu oblíbených: ALT+Y"
hint="\n\n[kliknutím na mě zavři]"

notify-send -t 35000 -c help -u critical -i $icon "$title" "$line1 $line2 $line3 $line4 $hint"
