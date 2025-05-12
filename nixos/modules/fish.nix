{ config, pkgs, ... }:

{

  environment.interactiveShellInit = ''
      # FISH AS INTERACTIVE SHELL ONLY
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
    '';

  programs.fish = {
    enable = true;
    shellAbbrs = {
      sudo="sudo";
      ls="ls --color=auto";
      grep="grep --color=auto";
      yay="cd ~/nixos && sudo nix flake update";
      yup="ya pack -u";
      clean="sudo nix-collect-garbage";
      cleanall="sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot";
      reb="reboot";
      nxs="nix-shell -p";
      nrs="sudo nixos-rebuild switch";
      nco="vim ~/nixos/configuration.nix";
      npk="vim ~/nixos/modules/pkgs.nix";
      nnn="nnn -dH";
  
      lspkg="nix-store --query --requisites /run/current-system | grep";
      lsgen="sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      lsdel=".dotfiles/scripts/genlist.sh";
      delgen="sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations";
      makecurrent="sudo /run/current-system/bin/switch-to-configuration boot";
  
      config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME";
      ga="git --git-dir=$HOME/.cfg/ --work-tree=$HOME add";
      gc="git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -a -m";
      ghp="git --git-dir=$HOME/.cfg/ --work-tree=$HOME push -u origin main";
      gcl="git clone git@github.com:lrestj/nixosnew.git";
      gs="git --git-dir=$HOME/.cfg/ --work-tree=$HOME status";
    };
  };

}
