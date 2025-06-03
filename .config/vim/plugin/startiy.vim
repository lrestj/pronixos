"Startify greeter

   let g:startify_update_oldfiles = 1
   let g:startify_files_number = 15
   let g:startify_skiplist = [
                 \ 'vimrc',
                 \ ]
         
   let g:startify_enable_special = 0
   let g:startify_custom_indices = ['e','y','v','a','x','n','f','g','h','u','i','o','p','l','k','j','w']
   let g:startify_custom_header = 'startify#pad(split(system("figlet -w 100 Vim -f cybermedium"), "\n"))'

   let s:vim_version = matchstr(execute('version'), 'Vi IMproved \zs\d[^ ]*')
   let s:ascii = [ ' verze ' . s:vim_version ]
   let g:startify_custom_footer = startify#center(s:ascii)

   let g:startify_lists = [
           \ { 'type': 'commands'},
           \ { 'type': 'files',     'header': ['     Nedávné...'] },
           \ { 'type': 'bookmarks', 'header': ['    󰃀 Záložky'] },
           \ { 'type': 'sessions',  'header': ['     Sezení'] },
           \ ]

   let g:startify_bookmarks = [
           \ { 'd':'~/.dotfiles'},
           \ { 'm': '~/.dotfiles/nixos/modules/' },
           \ { 'c': '~/.config/vim/' },
           \ ]

   let g:startify_commands = [
           \ ['󰎔 Nový soubor', ':enew'],
           \ [' Správce souborů', ':Yazi'],
           \ [' Vim config', ':e ~/.config/vim/vimrc' ],
           \ ]


""""" END OF FILE """""
