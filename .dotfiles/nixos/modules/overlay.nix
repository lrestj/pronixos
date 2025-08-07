{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      btop = prev.btop.overrideAttrs (old: {
        name = "btop-git";
        src = prev.fetchFromGitHub {
          owner = "aristocratos";
          repo = "btop";
          rev = "latest";
          hash = "";
        };
     });
    })
  ];
}
