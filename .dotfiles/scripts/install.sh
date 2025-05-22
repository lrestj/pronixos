#!/bin/sh

echo "Spouštím instalaci..."

alias cfg='git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'

echo ".cfg.git" >> .gitignore &&

echo "Kopírování z GitHub repozitáře..."

git clone --bare https://codeberg.org/lrestj/nixos.git &&

alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'

echo "Přesun konfigurace..."

cfg checkout -f &&

cp -fv /etc/nixos/hardware-configuration.nix /home/libor/.dotfiles/nixos/ && 

cfg config --local status.showUntrackedFiles no

echo "Konfigurace proběhla úspěšně."

ls --color=auto /home/.dotfiles/

echo "Nyní lze smazat původní adresář nixos."

echo " #sudo rm -r /etc/nixos "
