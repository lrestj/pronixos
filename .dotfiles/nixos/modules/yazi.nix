{ config, pkgs, ... }:

{
  programs.yazi.enable = true;  
  nixpkgs.overlays = [ yazi.overlays.default ];

}

