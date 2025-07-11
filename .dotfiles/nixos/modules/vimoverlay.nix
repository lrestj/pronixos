{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      vim-full = prev.vim-full.overrideAttrs (old: {
        name = "Vim-full-git";
        src = prev.fetchFromGitHub {
          owner = "vim";
          repo = "vim";
          rev = "HEAD";
          hash = "sha256-aQCeKeBn6l/MBywoODyXMSeZhp7Rpt1FUdWJ81ZYgTk=";
        };
     });
    })
  ];
}
