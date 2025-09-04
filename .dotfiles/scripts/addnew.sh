#!/bin/bash

sel=$(rofi -theme ~/.config/rofi/rofithemes/cloud.rasi -dmenu -p 'Jméno souboru')
file=~/.dotfiles/scripts/$sel

if [ $sel='~/.dotfiles/scripts/' ]; then
    notify-send -i data-error "Žádné jméno souboru" "Konec bez vytvoření souboru"
else   
    touch $file
    chmod +x $file
    echo "#!/bin/bash" > $file
    vim $file
fi
