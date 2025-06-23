#!/bin/bash

# git@github.com:lrestj/nixos.git
# ssh://git@codeberg.org/lrestj/nixos.git

git config --global user.email "rest@seznam.cz"
git config --global user.name "LrestJ"
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote remove origin
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add github git@github.com:lrestj/nixos.git
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add codeberg ssh://git@codeberg.org/lrestj/nixos.git

echo "Codeberg and Github remote repos added"
echo -e "\n"
echo "END OF INSTALLATION" 


##### END OF FILE #####
