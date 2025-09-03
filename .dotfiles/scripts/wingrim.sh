#!/bin/bash

grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" -g "$(slurp)" &&
 notify-send -i user-desktop "Snímek obrazovky" "Uložen do složky Obrázky"
