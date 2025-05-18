
### <div align="center"> 💻 My nixos config 💻 </div>



## ⚙️ Initializing a git bare repository
```
git init --bare $HOME/.cfg.git
```

💬 Define an alias for the command.    
```
alias cfg='git --git-dir=$HOME/.cfg.git --work-tree=$HOME'
```

💬 Run this next command to hide all files that we are not explicitly keeping track of.

```
cfg config --local status.showUntrackedFiles no
```

💬 Add the alias to your .bashrc or config.fish for convenience.

```
echo "alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'" >> $HOME/.bashrc
```


👍 And that’s it! You can add all kinds of files and directories in your repository.
```
cfg status
cfg add .bashrc
cfg commit -m "Add bashrc"
cfg push
```
## 📥 Cloning your previous configurations to your new installation
   
💬 Set up your alias before starting. Just type it in your terminal or add it to your .bashrc, config.fish.

```
alias cfg='git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'
```

💬 Add your git bare repository to a .gitignore file. This will help you avoid any recursion problems.

```
echo ".cfg.git" >> .gitignore
```

💬 You’re now ready to clone your dotfiles into a git bare repository.

```
git clone --bare git@github.com:lrestj/nixos.git $HOME/.cfg.git
```
or

```
git clone --bare ssh://git@codeberg.org/lrestj/nixos.git $HOME/.cfg.git
```

💬 Make sure that your alias is defined in your current shell scope.

```
alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'
```

💬 Checkout the contents of your bare repository to your $HOME directory.

```
cfg checkout
```


⚠️ This command might return some errors as you might have similarly named files already in your new installation.
```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
💬 You can force checkout with -f argument to overwrite existing files.
```
cfg checkout -f
```

💬 Once you run `cfg status`, you may see a lot of untracked files again. Run this command to hide them.

```
cfg config --local status.showUntrackedFiles no
```


👍 Your set up is now complete and you can add and update files using your `cfg` alias and git commands.

```
cfg status
cfg add .bashrc
cfg commit -m "Add bashrc"
cfg push
```
<div align="center"> 🔔&nbsp🔔&nbsp🔔&nbsp🔔&nbsp🔔 </div>
<div align="center"> 🇪 🇴 🇫 </div>
