{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      vim-full = prev.vim-full.overrideAttrs (old: {
        name = "Vim-full-git";
        src = prev.fetchFromGitHub {
          owner = "vim";
          repo = "vim";
          rev = "d0bf380efa4ab0aabc5479274043f0de1115a232";
          hash = "sha256-u0LsKNdTpdWE507MsiA9NOS7WTAfPJTVRwhAL2fKExw=";
        };
     });
    })
  ];
}
