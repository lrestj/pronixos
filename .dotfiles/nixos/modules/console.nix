{ config, pkgs, lib, ... }:

{

  console.enable = false;
  services.kmscon = {
      enable = true;
      autologinUser = "libor";
      fonts = [ { name = "Hack Nerd Font"; package = pkgs.nerd-fonts.hack; } ];
      hwRender = true;
      useXkbConfig = true;
      extraConfig = "font-size=12";
  };

}

#####  END OF FILE  #####
