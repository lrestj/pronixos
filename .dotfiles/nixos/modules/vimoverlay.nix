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
          hash = "sha256-Jgesb+/oAH4r9kXTPaij1Me26lQyjIw7T5vo5WLYBvQ=";
        };
     });
    })
  ];
}
