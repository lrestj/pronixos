"FZF search

let g:fzf_vim = {}
let g:fzf_vim.command_prefix = 'Fzf'

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
nnoremap <A-b> :Fzflua buffers<CR>
nnoremap <A-c> :Fzflua changes<CR>
nnoremap <A-d> :Fzflua files<CR>
nnoremap <A-f> :Fzflua rg<CR>
nnoremap <A-a> :Fzflua lines<CR>
nnoremap <A-l> :Fzflua bLines<CR>
nnoremap <A-m> :Fzflua marks<CR>
nnoremap <A-u> :Fzflua jumps<CR>
nnoremap <A-h> :Fzflua oldfiles<CR>
nnoremap <A-.> :Fzflua command_history<CR>
nnoremap <A-,> :Fzflua search_history<CR>


""""" END OF FILE """"""
