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
          # hash = "sha256-28q2FuAI/lUrLQWiGY358+52cRzV3NcO1jyrrgQ21Ik=";
          hash = "sha256-4036xk7lFA02mR/p8nk78VF9H2iRV9IiiQXtUYzuImk=";
        };
     });
    })
  ];
}
