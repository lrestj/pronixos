{ config, pkgs, ... }:

{
  programs.xfconf.enable = true;
  nixpkgs.overlays = [
    (final: prev: {
      xfce.thunar = prev.xfce.thunar.overrideAttrs (old: {
        gui = false;
        src = prev.fetchFromGitHub {
          owner = "xfce-mirror";
          repo = "thunar";
          rev = "latest";
          # If you don't know the hash, the first time, set:
          # hash = "";
          # then nix will fail the build with such an error message:
          # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
          # specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
          # got:    sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
          hash = "";
        };
     });
    })
  ];
}
