{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      vim-full = prev.vim-full.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "vim";
          repo = "vim";
          rev = "latest";
          hash = "sha256-4Smwlnr5V/q+pmHHMmoalRrvF2MSPRSKZstFTX4YQmA=";
        };
     });
    })
  ];
}
