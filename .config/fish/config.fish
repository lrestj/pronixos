if status is-interactive
    # Commands to run in interactive sessions can go here

abbr !! --position anywhere --function last_history_item
abbr  gc --set-cursor -- "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""

end

