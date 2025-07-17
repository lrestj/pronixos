{ config, pkgs, ... }:

{
  services.greetd = {
      enable = true;
      settings = rec {
          initial_session = {
              command = "${pkgs.hyprland}/bin/Hyprland";
              user = "libor";
          };
          default_session.command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${pkgs.bashInteractive}/bin/bash"; = initial_session;
      };
  };
}
