{
  pkgs,
  inputs,
  ...
}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/bin/Hyprland";
in {
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

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
