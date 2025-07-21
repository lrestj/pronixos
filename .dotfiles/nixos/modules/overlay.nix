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
          hash = "sha256-zyPtFqfJPzlb/QBxQ0j3hzWe9+0kTFH/XQ3aGp2jc2w=";
        };
     });
    })
  ];
}
