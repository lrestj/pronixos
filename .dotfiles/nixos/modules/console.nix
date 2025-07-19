{ config, pkgs, lib, ... }:

{

  console.enable = false;
  services.kmscon = {
      enable = true;
      fonts = [ { name = "Hack Nerd Font"; package = pkgs.nerd-fonts.hack; } ];
      hwRender = true;
      useXkbConfig = true;
  };

}

#####  END OF FILE  #####
