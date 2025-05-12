We’ll start by initializing a git bare repository.

---------------------------------
git init --bare $HOME/.cfg
---------------------------------


Define an alias for the command.    

--------------------------------------------------------------------
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
--------------------------------------------------------------------


Run this next command to hide all files that we are not explicitly keeping track of.

---------------------------------------------------
config config --local status.showUntrackedFiles no
---------------------------------------------------


Add the alias to your .bashrc or .zshrc or config.fish for convenience.

-----------------------------------------------------------------------------------------------
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
-----------------------------------------------------------------------------------------------


And that’s it! You have successfully set up your git bare repository. You can pass git commands to your alias and add your dotfiles and other configurations. Of course, this is not limited to just dotfiles. You can add all kinds of files and directories here.

config status

config add .bashrc

config commit -m "Add bashrc"

config push

------------------------------------------------------------------------------------------------------------------------------------------------

Cloning your previous configurations to your new installation
Your git repository is here and ready to settle in your new system.

Set up your alias before starting. You may just type it in your terminal or add it to your .bashrc, .zshrc, config.fish.

----------------------------------------------------------------------
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
----------------------------------------------------------------------


Add your git bare repository to a .gitignore file. This will help you avoid any recursion problems.

----------------------------
echo ".cfg" >> .gitignore
----------------------------


Again, .cfg is an arbitrary directory name. You can use any folder name you wish.

You’re now ready to clone your dotfiles into a git bare repository.

--------------------------------------------
git clone --bare <git-repo-url> $HOME/.cfg
--------------------------------------------


Make sure that your alias is defined in your current shell scope.

--------------------------------------------------------------------
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
--------------------------------------------------------------------

or

----------------
source .bashrc
----------------


Checkout the contents of your bare repository to your $HOME directory.

-----------------
config checkout
-----------------


Of course, this command might fail as you might have similarly named files already in your new installation. You may see errors such as the one below.

error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting

There is a solution mentioned in an article in Atlassian written by @durdn. It involves backing up the files using a shell script.

--------------------------------------------------------------------
mkdir -p .config-backup && \\
config checkout 2>&1 | egrep "\\s+\\." | awk {'print $1'} | \\
xargs -I{} mv {} .config-backup/{}

After running the above, run the checkout command again.

------------------
config checkout
------------------


Once you run config status, you may see a lot of untracked files again. Let’s set the showUntrackedStatus flag to noagain so we’ll only see files which we only explicitly track.

------------------------------------------------------
config config --local status.showUntrackedFiles no
------------------------------------------------------


Your set up is now complete and you can now add and update files using your config alias and git commands.


config status

config add .bashrc

config commit -m "Add bashrc"

config push
