### <div align="center"> 💻 My NixOS config 💻 </div>


##### ✌ Welcome to my repo. Feel free to look inside for an inspiration or just for fun. 

###### 🤔 I don't recommend to use this exact config on other system as it is still work in progress.

###### ✅ Also this readme file is just a reminder for me actually.


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
   

💬 Add your git bare repository to a .gitignore file. This will help you avoid any recursion problems.

```
echo ".cfg.git" >> .gitignore
```

💬 Clone your dotfiles into a git bare repository.

```
git clone --bare https://codeberg.org/lrestj/nixos.git /home/libor/.cfg.git
```


💬 Checkout the contents of your bare repository to your $HOME directory.

⚠️ This command will overwrite similarly named files in your new installation.

```
git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME checkout -f
```

💬 Run this command to hide untracked files again.

```
git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME config --local status.showUntrackedFiles no
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
