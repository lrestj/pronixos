          let mapleader=" "
          nnoremap ; :
          nnoremap : ;
          nnoremap <BS> X
          nnoremap <A-j> :m .+1<CR>
          nnoremap <A-k> :m .-2<CR>
          inoremap <A-j> <Esc>:m .+1<CR>gi
          inoremap <A-k> <Esc>:m .-2<CR>gi
          vnoremap <A-j> :m '>+1<CR>gv
          vnoremap <A-k> :m '<-2<CR>gv
          vnoremap <C-c> "+y
          vnoremap <C-v> "+p
          noremap <C-tab> <C-w>w
          noremap <C-tab> <C-w>w
          noremap <C-j> <C-w>j
          noremap <C-k> <C-w>k
          noremap <C-h> <C-w>h
          noremap <C-l> <C-w>l
          noremap <C-b> :bp<CR>
          noremap <C-n> :bn<CR>
          noremap <leader>a :normal! ggV$G$<CR>
          noremap <leader>l <C-w>L
          noremap <leader>h <C-w>H
          noremap <leader>x :bd<CR>
          noremap <leader>v :vnew<CR>
          noremap <leader>y :Yazi<CR>
          "noremap <leader>ww :w !sudo tee > /dev/null %<CR>
          noremap <silent>  <leader>ww :SudoWrite %<CR>
          noremap <leader>s :Startify<CR>
          nnoremap <leader><Tab> :buffer<Space>
          nnoremap <leader><leader> :set relativenumber!<CR>
          nnoremap <leader>nn :set nohlsearch<CR>
          nnoremap <leader>q ZQ

          " Number list macro
          noremap <leader>n I0gvg
          
          colorscheme default
          syntax on
          set wildmenu
          set wildoptions=pum,tagfile
          set mouse=a
          set nocompatible
          set backspace=indent,eol,start
          set autoread
          set laststatus=2
          set showtabline=1
          set directory=~/Veřejné//
          set ignorecase
          set ruler
          set number
          set scrolloff=2
          set tabstop=2 shiftwidth=2 expandtab
       
      	  let g:suda#prompt = 'Heslo: '
          

 
         " PLUGINS
         
         call plug#begin()

           " List your plugins here
           Plug 'tpope/vim-sensible'
           Plug 'mhinz/vim-startify'
           Plug 'chriszarate/yazi.vim'
           Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
           Plug 'junegunn/fzf.vim'
         call plug#end()



          " Startify greeter
          let g:startify_update_oldfiles = 1
          let g:startify_files_number = 15
         " let g:startify_skiplist = [
         "        \ '~/.dotfiles/nixos/modules/neovim.nix',
         "        \ ]
      
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

      
          " NerdTree like settings
                  let g:netrw_banner = 0
                  let g:netrw_liststyle = 3
                  let g:netrw_browse_split = 4
                  let g:netrw_altv = 1
                  let g:netrw_winsize = 25
                  let g:netrw_browse_split = 0


          " Cursor modes change
              " Vertical bar in insert mode  
              let &t_SI = "\<Esc>[6 q"
              " Underline in replace mode
              let &t_SR = "\<Esc>[4 q"
              " Block in other modes
              let &t_EI = "\<Esc>[2 q"
