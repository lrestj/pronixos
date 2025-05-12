{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    nnn
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig = {
        packages.myplugins = with pkgs.vimPlugins; {
          start = [
            vim-nix
            vim-lastplace
            nnn-vim
            vim-commentary
            ];
          opt = [];
        };
        customRC = ''
          noremap ; :
          cnoremap <C-s> execute 'silent! write !sudo tee "%" >/dev/null' <bar> edit!<CR>
          nnoremap <C-j> <C-w>j
          nnoremap <C-k> <C-w>k
          nnoremap <C-h> <C-w>h
          nnoremap <C-l> <C-w>l
          noremap <C-n> :bn<CR>
          noremap <leader>v :vsplit<CR>
          noremap <leader>a :normal! ggV$G$<CR>
          noremap <leader>E :Yazi<CR>
          noremap <leader>y :NnnPicker<CR>
          noremap <leader>o :e /home/libor/.dotfiles/modules/programs.nix<CR>
          set relativenumber
          set mouse=a
          set nocompatible
          set backspace=indent,eol,start
          set autoread
          set laststatus=2
          set showtabline=1
          set ruler
          syntax on
          set number
          colorscheme default
          set directory=~/Veřejné//

          "Mode Settings
             let &t_SI.="\e[6 q" "SI = INSERT mode
             let &t_SR.="\e[4 q" "SR = REPLACE mode
             let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
                                 "Cursor settings:
                                 " 1 -> blinking block
                                 " 2 -> solid block
                                 " 3 -> blinking underscore
                                 " 4 -> solid underscore
                                 " 5 -> blinking vertical bar
                                 " 6 -> solid vertical bar
      '';
      };
    }
  )];

}
