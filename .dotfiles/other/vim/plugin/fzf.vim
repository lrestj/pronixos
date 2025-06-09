"FZF search

let g:fzf_vim = {}
let g:fzf_vim.command_prefix = 'Fzf'

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
nnoremap <A-b> :FzfBuffers<CR>
nnoremap <A-c> :FzfChanges<CR>
nnoremap <A-d> :FzfFiles<CR>
nnoremap <A-f> :FzfRg<CR>
nnoremap <A-a> :FzfLines<CR>
nnoremap <A-l> :FzfBLines<CR>
nnoremap <A-m> :FzfMarks<CR>
nnoremap <A-u> :FzfJumps<CR>
nnoremap <A-h> :FzfHistory<CR>
nnoremap <A-.> :FzfHistory:<CR>
nnoremap <A-,> :FzfHistory/<CR>


""""" END OF FILE """"""
