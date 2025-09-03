#!/bin/bash

grim -g "$(slurp)" && notify-send -i user-desktop "Snímek obrazovky" "Uložen do složky Obrázky"
