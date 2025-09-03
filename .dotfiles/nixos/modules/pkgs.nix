{ config, pkgs, inputs, pkgsStable, ... }:

{

  imports = [ 
      ./joypixels.nix
      # ./overlay.nix
  ]; 
  
  fonts.packages = with pkgs; [
      font-awesome
      corefonts vista-fonts
      noto-fonts
      nerd-fonts.hack
      jetbrains-mono
      nerd-fonts.symbols-only
  ];
  
  _module.args.pkgsStable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };

    environment.systemPackages =
        (with pkgs; [
            alacritty
            baobab
            bibata-cursors
            brave
            brightnessctl
            btop
            cliphist
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
            glib util-linux
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
            lshw
            lxqt.lxqt-policykit
            mako
            mpv
            networkmanagerapplet
            nwg-look
            pamixer
            pavucontrol
            pcmanfm
            pdfarranger
            rclone
            reaper  
            reaper-reapack-extension
            reaper-sws-extension
            ripgrep
            rofi
            rofimoji
            simple-scan
            slurp
            swaybg
            tmux
            udiskie
            ueberzugpp
            unzip
            # vim-full
            vlc
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
            yazi
            ytdownloader
            zip
            p7zip
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
            ])

        ++

        (with pkgsStable; [
            vim-full
        ]);
  
  programs = {
      sway.enable = true;
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
