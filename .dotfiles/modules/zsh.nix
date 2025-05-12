{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableLsColors = true;
    ohMyZsh.enable = true;
    ohMyZsh.theme = "bira";
  };

  users.defaultUserShell = pkgs.zsh;

}
