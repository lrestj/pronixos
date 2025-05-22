{ config, pkgs, ... }:

{

  programs.bash.shellInit = ''
    # If not running interactively, don't do anything
    [[ $- != *i* ]] && return
  
    # BASH PROMPT LOOK	
       # Black:30  Blue:34  Cyan:36   Green:32   Purple:35   Red:31   White:37   Yellow:33
    PS1='\[\033[1;33m\][\u@\h \[\033[1;34m\]\w]\[\033[00m\]\$ '
  
  '';
  

  programs.bash.shellAliases = {
    sudo="sudo";
    ls="ls --color=auto";
    grep="grep --color=auto";
    sss="sudo $(history -p !!)";
    yay="cd ~/.dotfiles && sudo nix flake update";
    yup="ya pack -u";
    clean="sudo nix-collect-garbage";
    cleanall="sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot";
    reb="reboot";
    nxs="nix-shell -p";
    nrs="sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/";
    nco="vim ~/.dotfiles/nixos/configuration.nix";
    npk="vim ~/.dotfiles/nixos/modules/pkgs.nix";
    bas="vim ~/.dotfiles/nixos/modules/bash.nix";
    nnn="nnn -dH";
  
    lspkg="nix-store --query --requisites /run/current-system | grep";
    lsgen="sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
    delgen="sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations";
  
    ga="git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add";
    gc="git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m";
    ghp="git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push -u github main";
    cbp="git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push codeberg main";

    gcl="git clone --bare git@github.com:lrestj/nixos.git";
    gs="git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status";
  };

}
