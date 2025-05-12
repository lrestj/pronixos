#!/bin/sh

#git clone git@github.com:lrestj/nixos.git /home/libor/.dotfiles
cp /etc/nixos/hardware-configuration.nix /home/libor/.dotfiles/modules &&
sudo rm -r /etc/nixos &&
sudo ln -s ~/.dotfiles /etc/nixos &&

rm -rf /home/libor/.config/clipse
rm -rf /home/libor/.config/fish
rm -rf /home/libor/.config/gtk-3.0
rm -rf /home/libor/.config/gtk-4.0
rm -rf /home/libor/.config/hypr
rm -rf /home/libor/.config/mako
rm -rf /home/libor/.config/rofi
rm -rf /home/libor/.config/waybar
rm -rf /home/libor/.config/wlogout
rm -rf /home/libor/.config/yazi
rm -rf /home/libor/.config/REAPER
rm -rf /home/libor/.config/alacritty
rm -rf /home/libor/.config/kitty
rm -rf /home/libor/.config/ranger
ln -s /home/libor/.dotfiles/dotconfig/clipse /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/fish /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/gtk-3.0 /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/gtk-4.0 /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/hypr /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/mako /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/rofi /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/waybar /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/wlogout /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/yazi /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/REAPER /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/alacritty /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/kitty /home/libor/.config/
ln -s /home/libor/.dotfiles/dotconfig/ranger /home/libor/.config/



