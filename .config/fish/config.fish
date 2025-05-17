if status is-interactive
    # Commands to run in interactive sessions can go here

abbr !! --position anywhere --function last_history_item
abbr sudo "sudo"
abbr ls "ls --color=auto"
abbr grep "grep --color=auto"
abbr yay "cd ~/.dotfiles && sudo nix flake update"
abbr yup "ya pack -u"
abbr clean "sudo nix-collect-garbage"
abbr cleanall "sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot"
abbr reb "reboot"
abbr nxs "nix-shell -p"
abbr nrs "sudo nixos-rebuild switch"
abbr nco "vim ~/.dotfiles/configuration.nix"
abbr npk "vim ~/.dotfiles/modules/pkgs.nix"
abbr nnn "nnn -dH"

abbr lspkg "nix-store --query --requisites /run/current-system | grep"
abbr lsgen "sudo nix-env -p /nix/var/nix/profiles/system --list-generations"
abbr lsdel ".dotfiles/scripts/genlist.sh"
abbr delgen "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations"
abbr makecurrent "sudo /run/current-system/bin/switch-to-configuration boot"

abbr cfg "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
abbr ga "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add"
abbr gc --set-cursor -- "git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""
abbr ghp "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push -u origin main"
abbr gcl "git clone --bare git@github.com:lrestj/nixos.git"
abbr gs "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status"
abbr str "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A "
abbr untrack "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree"

end

