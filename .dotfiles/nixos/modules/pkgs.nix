{ config, pkgs, inputs, ... }:

{

  imports = [ 
      ./joypixels.nix
  ]; 
  
  fonts.packages = with pkgs; [
      font-awesome
      noto-fonts
      nerd-fonts.hack
      jetbrains-mono
      nerd-fonts.symbols-only
  ];
  
  
  environment.systemPackages = with pkgs; [
      reaper  
      reaper-reapack-extension
      reaper-sws-extension
      brave
      brightnessctl
      btop
      clipse
      efibootmgr
      exfatprogs
      fastfetch
      figlet
      fish
      foot
      fzf
      font-manager
      geany
      gimp
      gthumb
      hunspellDicts.cs_CZ
      hunspellDicts.en_US
      hypridle
      hyprlock
      hyprshot
      jq
      kdePackages.ark
      kdePackages.breeze
      kdePackages.breeze-icons
      kdePackages.filelight
      kdePackages.kcalc
      kdePackages.okular
      kdePackages.oxygen-icons
      kdePackages.partitionmanager
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
      pcmanfm-qt
      pdfarranger
      qimgv
      qjackctl
      qpwgraph
      ripgrep
      rofi rofimoji
      elegant-sddm
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
      xournalpp
      yazi
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
      hyprland = {
          enable = true;
          xwayland.enable = true;
      };
      dconf.enable = true;  
      kdeconnect.enable = true;
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
