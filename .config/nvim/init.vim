""""" NEOVIM CONFIGURATION """""

    "My remaps
    let mapleader=" "
    nnoremap ; :
    nnoremap : ;
    nnoremap <leader>q ZQ
    nnoremap <leader><leader> :set relativenumber!<CR>
    nnoremap <leader>, :set nohlsearch<CR>
    noremap <leader>y :Tfm<cr>
    noremap <leader>a :normal! ggV$G$<CR>
    command! W execute 'SudaWrite<CR>'

    "Line down and up
    nnoremap <A-j> :m .+1<CR>
    nnoremap <A-k> :m .-2<CR>
    vnoremap <A-j> :m '>+1<CR>gv
    vnoremap <A-k> :m '<-2<CR>gv

    "Window next, buffer next, delete and vsplit
    noremap <leader>n <C-w>w
    noremap <leader>b :bn<CR>
    noremap <leader>x :bd<CR>
    noremap <leader>v :vnew<CR>

    "FZF settings
    let g:fzf_vim = {}
    let g:fzf_vim.command_prefix = 'Fzf'
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
    nnoremap <A-b> :FzfBuffers<CR>
    nnoremap <A-c> :FzfChanges<CR>
    nnoremap <A-d> :FzfFiles<CR>
    nnoremap <A-g> :FzfRg<CR>
    nnoremap <A-s> :FzfLines<CR>
    nnoremap <A-a> :FzfBLines<CR>
    nnoremap <A-m> :FzfMarks<CR>
    nnoremap <A-u> :FzfJumps<CR>
    nnoremap <A-f> :FzfHistory<CR>
    nnoremap <A-.> :FzfHistory:<CR>
    nnoremap <A-,> :FzfHistory/<CR>
    
    "Optional settings
    colorscheme wildcharm
    filetype plugin indent on
    set cul laststatus=1
    set directory=~/Public/
    set ignorecase smartcase
    set lazyredraw
    set scrolloff=5
    set spelllang=cs,en
    set tabstop=4 shiftwidth=4 expandtab
    set shada=!,'30,<50,s10,h
    let g:suda#prompt = 'Heslo: '
    set ruler rulerformat=%63(%F\ \ %v\ \ \ %l/%L\ \ %p%%%=\ \%)

    "Statusline
    hi StatusLine guifg=#153bda guibg=#000000         
    set statusline=%n\ %f\ %m\ \ \ %v\ \ %l/%L%<%h%w%r\ \ \ %y%=\ \ 

    " Transparent background
    high Normal guibg=none
    high NonText guibg=none
    high LineNr guibg=none
         
    "Plugins
    call plug#begin()
    Plug 'junegunn/vim-peekaboo'
    Plug 'Rolv-Apneseth/tfm.nvim'
    Plug 'ibhagwan/fzf-lua'
    Plug 'lambdalisue/vim-suda'
    call plug#end()

""""" END OF FILE """""
