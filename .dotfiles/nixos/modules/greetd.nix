{ pkgs, ... }:

let
  session = "${pkgs.hyprland}/bin/Hyprland";
in

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${session}";
        user = "libor";
      };
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${session}";
        user = "libor";
      };
    };
  };
}

