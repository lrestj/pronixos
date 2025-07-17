{ config, pkgs, ... }:

{
  services.greetd = {
      enable = true;
      settings = rec {
          initial_session = {
              command = "${pkgs.hyprland}/bin/Hyprland";
              user = "libor";
          };
          default_session = initial_session;
      };
  };
}
