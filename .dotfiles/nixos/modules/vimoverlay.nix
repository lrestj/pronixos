{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      vim-full = prev.vim-full.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "vim";
          repo = "vim";
          rev = "HEAD";
          hash = "sha256-xk6DhYk8Jy7BrUiytb2z1aKujyfGF2q1B9tk1zrZyH4=";
        };
     });
    })
  ];
}
