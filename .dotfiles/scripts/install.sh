#!/bin/bash

echo "Spouštím instalaci..."

echo ".cfg.git" >> .gitignore &&

echo "kopírování z Codeberg repozitáře..."

git clone --bare https://codeberg.org/lrestj/nixos.git /home/libor/.cfg.git &&

echo "Přesun konfigurace..."

git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME checkout -f &&

cp -fv /etc/nixos/hardware-configuration.nix /home/libor/.dotfiles/nixos/ && 

# git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME config --local status.showUntrackedFiles no

echo "Probíhá konfigurace systému..."

sudo nixos-rebuild switch --flake /home/libor/.dotfiles/nixos/ &&

echo "Nyní lze smazat původní adresář nixos."

echo " #sudo rm -r /etc/nixos "

xdg-user-dir-update

git config --global user.email "rest@seznam.cz"
git config --global user.name "LrestJ"
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote remove origin
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add github git@github.com:lrestj/nixos.git
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add codeberg ssh://git@codeberg.org/lrestj/nixos.git

echo "Codeberg and Github remote repos added"
echo -e "\n"
echo "Konec instalace" 


##### END OF FILE #####
