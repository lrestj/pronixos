We’ll start by initializing a git bare repository.

------------------------------------
git init --bare $HOME/.cfg.git
------------------------------------


Define an alias for the command.    

-----------------------------------------------------------------------------
alias cfg='git --git-dir=$HOME/.cfg.git --work-tree=$HOME'
-----------------------------------------------------------------------------


Run this next command to hide all files that we are not explicitly keeping track of.

-----------------------------------------------------------
cfg config --local status.showUntrackedFiles no
-----------------------------------------------------------


Add the alias to your .bashrc or .zshrc or config.fish for convenience.

-----------------------------------------------------------------------------------------------------------
echo "alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'" >> $HOME/.bashrc
-----------------------------------------------------------------------------------------------------------


And that’s it! You have successfully set up your git bare repository. You can pass git commands to your alias and add your dotfiles and other configurations. Of course, this is not limited to just dotfiles. You can add all kinds of files and directories here.

cfg status

cfg add .bashrc

cfg commit -m "Add bashrc"

cfg push

------------------------------------------------------------------------------------------------------------------------------------------------

Cloning your previous configurations to your new installation
Your git repository is here and ready to settle in your new system.

Set up your alias before starting. You may just type it in your terminal or add it to your .bashrc, .zshrc, config.fish.

-------------------------------------------------------------------------
alias cfg='git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'
-------------------------------------------------------------------------


Add your git bare repository to a .gitignore file. This will help you avoid any recursion problems.

------------------------------------
echo ".cfg.git" >> .gitignore
------------------------------------



You’re now ready to clone your dotfiles into a git bare repository.

---------------------------------------------------------------------------------
git clone --bare git@github.com:lrestj/nixosnew.git $HOME/.cfg.git
---------------------------------------------------------------------------------


Make sure that your alias is defined in your current shell scope.

--------------------------------------------------------------------------
alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'
--------------------------------------------------------------------------

or

-------------------
source .bashrc
-------------------


Checkout the contents of your bare repository to your $HOME directory.

-----------------
cfg checkout
-----------------


Of course, this command might fail as you might have similarly named files already in your new installation. You may see errors such as the one below.

error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting

There is a solution mentioned in an article in Atlassian written by @durdn. It involves backing up the files using a shell script.

--------------------------------------------------------------------
mkdir -p .cfg-backup && \\
cfg checkout 2>&1 | egrep "\\s+\\." | awk {'print $1'} | \\
xargs -I{} mv {} .cfg-backup/{}

After running the above, run the checkout command again.

------------------
cfg checkout
------------------


Once you run cfg status, you may see a lot of untracked files again. Let’s set the showUntrackedStatus flag to noagain so we’ll only see files which we only explicitly track.

----------------------------------------------------------
cfg config --local status.showUntrackedFiles no
----------------------------------------------------------


Your set up is now complete and you can now add and update files using your cfg alias and git commands.


cfg status

cfg add .bashrc

cfg commit -m "Add bashrc"

cfg push
