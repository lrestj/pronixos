#!/bin/sh

echo "Spouštím instalaci...."

alias cfg='git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'

echo ".cfg.git" >> .gitignore &&

echo "Kopírování z GitHub repozitáře..."

#git clone --bare ssh://git@codeberg.org/lrestj/nixos.git $HOME/.cfg.git &&

git clone --bare git@github.com:lrestj/nixos.git $HOME/.cfg.git &&

alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'

echo "Přesun konfigurace..."

cfg checkout -f &&

cp -fv /etc/nixos/hardware-configuration.nix /home/libor/.dotfiles/nixos/ &&

cfg config --local status.showUntrackedFiles no

#sudo rm -r /etc/nixos

echo "Instalace konfiguračních souborů proběhla úspěšně."
