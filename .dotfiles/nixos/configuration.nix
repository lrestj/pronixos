{ config, pkgs, lib, ... }:

{

  imports =
      [ # Include hardware-configuration.nix
        ./hardware-configuration.nix
        ./modules/pkgs.nix
      ];

  xdg.portal.enable = true;
  documentation.man.generateCaches = false;
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

  hardware = {
      cpu.intel.updateMicrocode = true;
      graphics = {
          enable = true;
          extraPackages = with pkgs; [
              intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
              libvdpau-va-gl
          ];
      }; 
      sane = {
          enable = true; # enables support for SANE scanners
          extraBackends = [ pkgs.hplip ];
      };
  };
  
  nix = {
      settings = {
          experimental-features = [ "nix-command" "flakes" ];
          download-buffer-size = 125829120;
      };
      gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 14d";
      };
  };
  
  security = {
      rtkit.enable = true;
      polkit.enable = true;
  };

  systemd.sleep.extraConfig = ''
      AllowHibernation=no
      AllowHybridSleep=no
      AllowSuspendThenHibernate=no
  '';

  users.users.libor = {
      isNormalUser = true;
      description = "libor";
      extraGroups = [ "networkmanager" "wheel" "scanners" "lp" "input" ];
  };

  boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      kernel.sysctl."vm.swappiness" = 10;
      loader = {
          timeout = 2;
          systemd-boot = {
              enable = true;
              configurationLimit = 7;
              extraEntries = {
                  "debian.conf" = ''
                      title Debian
                      efi /EFI/debian/shimx64.efi
                  '';
             };
         };
          efi = {
              canTouchEfiVariables = true;
              efiSysMountPoint = "/boot";
          };
      };
  };

  networking = {
      hostName = "nixos";
      networkmanager.enable = true;
      firewall = {
          enable = true;
          #allowedTCPPorts = [ ... ];
          #allowedUDPPorts = [ ... ];
      };
  };

  # Locale settings
  console.keyMap = "cz-lat2";
  time.timeZone = "Europe/Prague";
  i18n.defaultLocale = "cs_CZ.UTF-8";
  i18n.extraLocaleSettings = {
      LC_ADDRESS = "cs_CZ.UTF-8";
      LC_IDENTIFICATION = "cs_CZ.UTF-8";
      LC_MEASUREMENT = "cs_CZ.UTF-8";
      LC_MONETARY = "cs_CZ.UTF-8";
      LC_NAME = "cs_CZ.UTF-8";
      LC_NUMERIC = "cs_CZ.UTF-8";
      LC_PAPER = "cs_CZ.UTF-8";
      LC_TELEPHONE = "cs_CZ.UTF-8";
      LC_TIME = "cs_CZ.UTF-8";
  };

  services = {
      power-profiles-daemon.enable = true;
      envfs.enable = true;
      gvfs.enable = true;
      udisks2.enable = true;
      xserver.xkb.layout = "cz";
      journald.extraConfig = "SystemMaxUse=50M";
      getty.autologinUser = "libor";
      displayManager = {
          sddm = {
              enable = true;
              wayland.enable = true;
              # package = pkgs.kdePackages.sddm;
              theme = "sugar-dark";
          };
          autoLogin = {
              enable = true;
              user = "libor";
          };
      };
      pipewire = {
          enable = true;
          alsa = {
              enable = true;
              support32Bit = true;
              };
          pulse.enable = true;
          jack.enable = true;
          extraConfig.jack = {
              "10-clock-rate" = {
                  "jack.properties" = {
                      "node.latency" = "256/48000";
                      "node.rate" = "1/48000";
                      "node.lock-quantum" = true;
                  };
              };
          };
      };

      # To add the printer run:
      # NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'
      printing = {
          enable = true;
          drivers = [ pkgs.hplip ];
      };
      avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
      };
      openssh = {
          enable = true;
          settings = {
              PermitRootLogin = "no";
              PasswordAuthentication = false;
          };
      };
  };

  # NFS Synology shares:
  fileSystems."/data/nfs/FilmyNas" = {
      device = "192.168.77.18:/volume1/Filmy";
      fsType = "nfs";
      options = [ "users" "nofail"  ];
  };
  fileSystems."/data/nfs/DataNas" = {
      device = "192.168.77.18:/volume1/Rodinas";
      fsType = "nfs";
      options = [ "users" "nofail" ];
  };
  fileSystems."/data/nfs/HudbaNas" = {
      device = "192.168.77.18:/volume1/Hudba";
      fsType = "nfs";
      options = [ "users" "nofail" ];
  };
  
  # Release version of the first install of this system
  system.stateVersion = "25.05";

}

#####  END OF FILE  #####
