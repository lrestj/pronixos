{ config, pkgs, lib, ... }:

{

  fonts.packages = with pkgs; [
      joypixels
  ];

  nixpkgs.config = {
      allowUnfreePredicate = pkg:
          builtins.elem (lib.getName pkg) [
              "joypixels"
          ];         
    joypixels.acceptLicense = true;
  };

}

#####  END OF FILE  #####
