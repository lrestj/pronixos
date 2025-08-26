#!/bin/bash

tput setaf 166 bold; echo "Spouštím instalaci..."

echo ".cfg.git" >> .gitignore &&

tput setaf 166 bold; echo "Kopírování z repozitáře..."

git clone --bare https://github.com/lrestj/pronixos.git /home/libor/.cfg.git

tput setaf 166 bold; echo "Přesun konfigurace..."

git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME checkout -f &&

cp -fv /etc/nixos/hardware-configuration.nix /home/libor/.dotfiles/nixos/ && 

tput setaf 166 bold; echo "Probíhá konfigurace systému..."

sudo nixos-rebuild switch --flake /home/libor/.dotfiles/nixos/ &&

tput setaf 166 bold; echo "Nyní lze smazat původní adresář nixos."

echo " #sudo rm -r /etc/nixos "

git config --global user.email "rest@seznam.cz"
git config --global user.name "LrestJ"
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote remove origin
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add github git@github.com:lrestj/pronixos.git
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add codeberg ssh://git@codeberg.org/lrestj/nixos.git

echo -e "\n"
tput setaf 166 bold; echo "Konec instalace" 


##### END OF FILE #####
