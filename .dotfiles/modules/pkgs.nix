{ config, pkgs, inputs, ... }:

{

  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts-cjk-sans
    nerd-fonts.hack
    nerd-fonts.fira-mono
    nerd-fonts.roboto-mono
    nerd-fonts.symbols-only
  ];


  environment.systemPackages = with pkgs; [
    audacity
    kdePackages.ark
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
    kdePackages.filelight
    font-manager
    gimp
    gthumb
    haruna
    hunspellDicts.cs_CZ
    hunspellDicts.en_US
    hypridle
    hyprlock
    hyprpolkitagent
    hyprshot
    jq
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.kalk
    kdePackages.kate
    kdePackages.partitionmanager
    kdePackages.qt6ct
    kdePackages.qtsvg
    kdePackages.qtwayland
    killall
    krename
    libnotify
    libreoffice-fresh
    mako
    mpv
    networkmanagerapplet
    kdePackages.okular
    kdePackages.oxygen-icons
    pavucontrol
    pcmanfm-qt
    pdfarranger
    qimgv
    qjackctl
    qpwgraph
    ranger
    ripgrep
    rofi rofimoji
    sddm-chili-theme
    simple-scan
    slurp
    swaybg
    udiskie
    ueberzugpp
    unzip
    vlc
    waybar
    waypaper
    wget
    wl-clipboard
    wlogout
    wlsunset
    xdg-desktop-portal
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
