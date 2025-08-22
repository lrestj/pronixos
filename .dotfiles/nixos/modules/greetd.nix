{ pkgs,inputs, ...}:

  let
    tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
    hyprland-session = "${pkgs.hyprland}/bin/Hyprland";
  in
 
{

  services.greetd = {
      enable = true;
      settings = {
          initial_session = {
              command = "${hyprland-session}";
              user = "libor";
          };
          default_session = {
              command = "${tuigreet} --greeting 'Vítejte v NixOS!' --asterisks --time --time-format %c --remember --remember-session --sessions ${hyprland-session}";
              user = "greeter";
          };
      };
  };

  systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
  };

}
