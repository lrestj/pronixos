{ config, pkgs, lib, ... }:

{

  imports =
    [ # Include hardware-configuration.nix
      ./hardware-configuration.nix
      ./modules/pkgs.nix
      ./modules/neovim.nix	
    ];


  environment.variables = {
    EDITOR = "nvim";
  };


  boot.kernelPackages = pkgs.linuxPackages_latest;
  xdg.portal.enable = true;
  documentation.man.generateCaches = false;
  nixpkgs.config.allowUnfree = true;
  hardware.cpu.intel.updateMicrocode = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      download-buffer-size = 94371840;
    };
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  systemd.sleep.extraConfig = ''
    #AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';


  users.users.libor = {
    isNormalUser = true;
    description = "libor";
    extraGroups = [ "networkmanager" "wheel" "scanners" "lp" "input" ];
    packages = with pkgs; [];
  };


  boot.loader = {
    timeout = 2;
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      theme = ./grubtheme;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
        menuentry "Debian" --class debian {
        search --set=myroot --fs-uuid 69FC-8252
        chainloader /EFI/debian/grubx64.efi
        }
        #menuentry "endeavourOS" --class endeavourOS {
        #set root=(hd0,1)
        #chainloader /EFI/endeavouros/grubx64.efi
        #}
        menuentry "Fedora" --class fedora {
        set root=(hd0,1)
        chainloader /EFI/fedora/shimx64.efi
        }
        menuentry "Restartovat" --class restart {
        echo "Restartování..."
        reboot
        }
        menuentry "Vypnout" --class shutdown {
        echo "Vypínání..."
        halt
        }
      '';
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


  # Select internationalisation properties.
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
    gvfs.enable = true;
    udisks2.enable = true;
    xserver.xkb.layout = "cz";
    journald.extraConfig = "SystemMaxUse=50M";
    getty.autologinUser = "libor";
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "chili";
      };
      autoLogin = {
	enable = true;
        user = "libor";
      };
    };
    power-profiles-daemon.enable = true;
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
  hardware.sane = {
    enable = true; # enables support for SANE scanners
    extraBackends = [ pkgs.hplip ];
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
  system.stateVersion = "24.05";

}


#####  END OF FILE  #####
