          " Startify greeter
          let g:startify_update_oldfiles = 1
          let g:startify_files_number = 15
          let g:startify_skiplist = [
                 \ 'init.vim',
                 \ ]
      
          let g:startify_enable_special = 0
          let g:startify_custom_indices = ['e', 'y', 'n', 'a', 'x', 'f', 'g', 'h', 'u', 'i', 'l', 'w']
          let g:startify_custom_header = 'startify#pad(split(system("figlet -w 100 Neovim -f cybermedium"), "\n"))'
      
          let s:nvim_version = matchstr(execute('version'), 'NVIM v\zs[^\n]*')
          let s:ascii = [ ' verze ' . s:nvim_version ]
          let g:startify_custom_footer = startify#center(s:ascii)
      
          let g:startify_lists = [
                  \ { 'type': 'commands'},
                  \ { 'type': 'files',     'header': ['     Nedávné...'] },
                  \ { 'type': 'bookmarks', 'header': ['    󰃀 Záložky'] },
                  \ { 'type': 'sessions',  'header': ['     Sezení'] },
                  \ ]

      	  let g:startify_bookmarks = [
                  \ { 'd': '~/.dotfiles'},
                  \ { 'm': '~/.dotfiles/nixos/modules/' },
                  \ { 'c': '~/.config' },
                  \ ]

          let g:startify_commands = [
                  \ ['󰎔 Nový soubor', ':enew'],
                  \ [' Správce souborů', ':Yazi'],
                  \ [' Neovim init', ':e ~/.config/nvim/init.vim' ],
                  \ ]


""""" END OF FILE """""
