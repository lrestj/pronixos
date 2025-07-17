{ config, pkgs, ... }:

{

  imports = [ 
      ./joypixels.nix
      # ./vimoverlay.nix
  ]; 
  
  fonts.packages = with pkgs; [
      font-awesome
      noto-fonts
      nerd-fonts.hack
      jetbrains-mono
      nerd-fonts.symbols-only
  ];
  
  
  environment.systemPackages = with pkgs; [
      alacritty
      baobab
      bibata-cursors
      brave
      brightnessctl
      btop
      clipse
      dconf-editor
      efibootmgr
      eog
      evince
      exfatprogs
      fastfetch
      figlet
      file-roller
      fish
      font-manager
      foot
      fzf
      geany
      gnome-calculator
      gthumb
      hunspellDicts.cs_CZ
      hunspellDicts.en_US
      hypridle
      hyprlock
      hyprshot
      jq
      kdePackages.breeze-icons
      kdePackages.qt6ct
      kdePackages.qtsvg
      kdePackages.qtwayland
      killall
      krename
      libnotify
      libreoffice-fresh
      lxqt.lxqt-policykit
      mako
      mpv
      neovim
      networkmanagerapplet
      nwg-look
      pamixer
      pavucontrol
      pdfarranger
      reaper  
      reaper-reapack-extension
      reaper-sws-extension
      ripgrep
      rofi rofimoji
      simple-scan
      slurp
      swaybg
      udiskie
      ueberzugpp
      unzip
      vim-full
      vlc
      waybar
      waypaper
      wget
      wl-clipboard
      wlogout
      wlsunset
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-utils
      xdg-user-dirs
      xnviewmp
      xournalpp
      ytdownloader
      zip p7zip
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
      };
      dconf.enable = true;  
      gnome-disks.enable = true;
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
