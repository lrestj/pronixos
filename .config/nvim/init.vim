""""" NEOVIM CONFIGURATION """""

    "source ~/.config/nvim/plugin/startify.vim

    "My remaps
    let mapleader=" "
    nnoremap ; :
    nnoremap : ;
    nnoremap <BS> X
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
    command! W execute 'SudaWrite<CR>'

    "Windows focus, rearrange and swap
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-h> <C-w>h
    noremap <C-l> <C-w>l
    noremap <C-n> <C-w>w
    noremap <leader>r <C-w>r
    noremap <leader>l <C-w>L
    noremap <leader>h <C-w>H

    "Buffers prev, next, delete,show and new vertical split
    noremap <leader>b :bp<CR>
    noremap <leader>n :bn<CR>
    noremap <leader>x :bd<CR>
    nnoremap <leader><Tab> :buffer<Space><Tab>
    noremap <leader>v :vnew<CR>

    "Telescope search
    noremap <A-d> :Telescope find_files<cr>
    noremap <A-g> :Telescope live_grep<cr>
    noremap <A-b> :Telescope buffers<cr>
    noremap <A-u> :Telescope jumplist<cr>
    noremap <A-o> :Telescope oldfiles<cr>
    noremap <A-c> :Telescope changes<cr>


    "Numbered list macro
    noremap <leader>c I0gvg
    
    "Optional settings
    colorscheme wildcharm
    set background=dark   
    filetype plugin indent on
    set cul
    set directory=~/Veřejné//
    set ignorecase smartcase
    set lazyredraw
    set number
    set scrolloff=2
    set showmatch mat=2
    set spelllang=cs,en
    set tabstop=2 shiftwidth=2 expandtab
    set wildcharm=<Tab>
    set shada=!,'30,<50,s10,h
    let g:suda#prompt = 'Heslo: '

    "Statusline
    highlight StatusLine guifg=#153bda guibg=#000000         
    set statusline=%n\ %f\ %m\ \ \ %v\ \ %l/%L%<%h%w%r\ \ \ %y
    set statusline+=%=reg\ {%{v:register}}\ \\ 

   "Plugins
   call plug#begin()
     " List your plugins here
     Plug 'mhinz/vim-startify'
     Plug 'junegunn/vim-peekaboo'
     Plug 'LnL7/vim-nix'
     Plug 'mikavilpas/yazi.nvim'
     Plug 'nvim-lua/plenary.nvim'
     Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
                              " or    , { 'branch': '0.1.x' }
   call plug#end()


        " Transparent background
        high Normal guibg=none
        high NonText guibg=none
        high LineNr guibg=none
         

     " Toggle background transparency
     let t:isTransparent = 0
     function! BGToggleTransparency()
       if t:isTransparent == 0
         hi Normal guibg=black
         set background=dark
         let t:isTransparent = 1
       else
          hi Normal guibg=none
          hi NonText guibg=none
          hi LineNr guibg=none
         let t:isTransparent = 0
       endif
     endfunction
     nnoremap <silent><A-t> :call BGToggleTransparency()<CR>


""""" END OF FILE """""
