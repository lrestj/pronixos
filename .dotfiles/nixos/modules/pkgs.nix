{ config, pkgs, inputs, pkgsStable, ... }:

{

  imports = [ 
      ./joypixels.nix
      # ./overlay.nix
  ]; 
  
  fonts.packages = with pkgs; [
      font-awesome
      noto-fonts
      nerd-fonts.hack
      jetbrains-mono
      nerd-fonts.symbols-only
  ];
  
  _module.args.pkgsStable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };

  environment.systemPackages = [
     pkgsStable.vim-full
     pkgs.alacritty
     pkgs.baobab
     pkgs.bibata-cursors
     pkgs.brave
     pkgs.brightnessctl
     pkgs.btop
     pkgs.clipse
     pkgs.dconf-editor
     pkgs.efibootmgr
     pkgs.eog
     pkgs.evince
     pkgs.exfatprogs
     pkgs.fastfetch
     pkgs.figlet
     pkgs.file-roller
     pkgs.fish
     pkgs.font-manager
     pkgs.foot
     pkgs.fzf
     pkgs.geany
     pkgs.gnome-calculator
     pkgs.gthumb
     pkgs.hunspellDicts.cs_CZ
     pkgs.hunspellDicts.en_US
     pkgs.hypridle
     pkgs.hyprlock
     pkgs.hyprshot
     pkgs.jq
     pkgs.kdePackages.breeze-icons
     pkgs.kdePackages.qt6ct
     pkgs.kdePackages.qtsvg
     pkgs.kdePackages.qtwayland
     pkgs.killall
     pkgs.krename
     pkgs.libnotify
     pkgs.libreoffice-fresh
     pkgs.lxqt.lxqt-policykit
     pkgs.mako
     pkgs.mpv
     pkgs.networkmanagerapplet
     pkgs.nwg-look
     pkgs.pamixer
     pkgs.pavucontrol
     pkgs.pdfarranger
     pkgs.reaper  
     pkgs.reaper-reapack-extension
     pkgs.reaper-sws-extension
     pkgs.ripgrep
     pkgs.rofi
     pkgs.rofimoji
     pkgs.simple-scan
     pkgs.slurp
     pkgs.swaybg
     pkgs.tmux
     pkgs.udiskie
     pkgs.ueberzugpp
     pkgs.unzip
     pkgs.vlc
     pkgs.waypaper
     pkgs.wget
     pkgs.wl-clipboard
     pkgs.wlogout
     pkgs.wlsunset
     pkgs.xdg-desktop-portal-gtk
     pkgs.xdg-desktop-portal-hyprland
     pkgs.xdg-utils
     pkgs.xdg-user-dirs
     pkgs.xnviewmp
     pkgs.xournalpp
     pkgs.yazi
     pkgs.ytdownloader
     pkgs.zip
     pkgs.p7zip
      (pkgs.writeScriptBin "sct" ''
          #!/bin/sh
          killall wlsunset &> /dev/null;
          if [ $# -eq 1 ]; then
            temphigh=$(( $1 + 1 ))
            templow=$1
            wlsunset -t $templow -T $temphigh &> /dev/null &
          else
            killall wlsunset &> /dev/null;
          fi
      '')
  ];
  
  
  programs = {
      xfconf.enable = true;
      dconf.enable = true;  
      gnome-disks.enable = true;
      thunar = {
          enable = true;
          plugins = with pkgs.xfce; [ 
              thunar-archive-plugin
              thunar-volman
          ];
      };
      hyprland = {
           enable = true;
           xwayland.enable = true;
           package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
           portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
      git = {
          enable = true;
          config = {
              safe.directory = "/home/libor/.dotfiles";
              init = {
                  defaultBranch = "main";
                  userName  = "libor";
                  userEmail = "rest@seznam.cz";
              };
          };
      };
  };

}

#####  END OF FILE  #####
