""""" VIM CONFIGURATION """""


          let mapleader=" "
          nnoremap ; :
          nnoremap : ;
          nnoremap <BS> X
          nnoremap Y y$
          nnoremap <leader>q ZQ
          nnoremap <leader><leader> :set relativenumber!<CR>
          nnoremap <leader>, :set nohlsearch<CR>
          noremap <leader>s :Startify<CR>
          noremap <leader>y :Yazi<CR>

          "Line down and up
          nnoremap <A-j> :m .+1<CR>
          nnoremap <A-k> :m .-2<CR>
          inoremap <A-j> <Esc>:m .+1<CR>gi
          inoremap <A-k> <Esc>:m .-2<CR>gi
          vnoremap <A-j> :m '>+1<CR>gv
          vnoremap <A-k> :m '<-2<CR>gv

          "Select all and sudo trick
          noremap <leader>a :normal! ggV$G$<CR>
          command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

          "Windows focus and swap
          noremap <C-j> <C-w>j
          noremap <C-k> <C-w>k
          noremap <C-h> <C-w>h
          noremap <C-l> <C-w>l
          noremap <leader>l <C-w>L
          noremap <leader>h <C-w>H

          "Buffers prev, next, delete,show and new vertical split
          noremap <leader>b :bp<CR>
          noremap <leader>n :bn<CR>
          noremap <leader>x :bd<CR>
          nnoremap <leader><Tab> :buffer<Space><Tab>
          noremap <leader>v :vnew<CR>

          "Numbered list macro
          noremap <leader>l I0gvg
          

          "Optional settings
          set background=dark   
          colorscheme wildcharm
          syntax on
          set nocompatible
          set autoread
          set backspace=indent,eol,start
          set cul
          set directory=~/Veřejné//
          set hidden
          set ignorecase smartcase
          set incsearch
          set laststatus=2
          set mouse=a
          set number
          set ruler
          set scrolloff=2
          set showmatch mat=2
          set showtabline=1
          set spell spelllang=cs,en
          set tabstop=2 shiftwidth=2 expandtab
          set ve+=onemore
          set wildcharm=<Tab>
          set wildmenu
          set wildoptions=pum,tagfile
          
 
         "Plugins
         call plug#begin()
           " List your plugins here
           Plug 'mhinz/vim-startify'
           Plug 'junegunn/vim-peekaboo'
           Plug 'LnL7/vim-nix'
           Plug 'chriszarate/yazi.vim'
           Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
           Plug 'junegunn/fzf.vim'
         call plug#end()


          "Startify greeter
          let g:startify_update_oldfiles = 1
          let g:startify_files_number = 15
      
          let g:startify_enable_special = 0
          let g:startify_custom_indices = ['e', 'y', 'v', 'a', 'x', 'c', 'f', 'g', 'h', 'u', 'i', 'l']
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
                  \ ]

          let g:startify_commands = [
                  \ ['󰎔 Nový soubor', ':enew'],
                  \ [' Správce souborů', ':Yazi'],
                  \ [' .vimrc', ':e ~/.vimrc' ],
                  \ ]


          "Cursor modes changes
              " Vertical bar in insert mode  
              let &t_SI = "\<Esc>[6 q"
              " Underline in replace mode
              let &t_SR = "\<Esc>[4 q"
              " Block in other modes
              let &t_EI = "\<Esc>[2 q"


""""" END OF FILE """""
