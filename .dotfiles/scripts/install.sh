#!/bin/bash

echo "Spouštím instalaci..."

echo ".cfg.git" >> .gitignore &&

echo "kopírování z Codeberg repozitáře..."

git clone --bare https://codeberg.org/lrestj/nixos.git /home/libor/.cfg.git &&

echo "Přesun konfigurace..."

git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME checkout -f &&

cp -fv /etc/nixos/hardware-configuration.nix /home/libor/.dotfiles/nixos/ && 

git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME config --local status.showUntrackedFiles no

echo "Konfigurace proběhla úspěšně."

ls --color=auto /home/.dotfiles/

echo "Nyní lze smazat původní adresář nixos."

echo " #sudo rm -r /etc/nixos "


##### END OF FILE #####
