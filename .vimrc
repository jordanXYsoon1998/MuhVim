set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run install script if you use fzf only in Vim.
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'

call plug#end()

set expandtab
set sw=4
set ts=4
autocmd Filetype ruby,eruby set softtabstop=2
autocmd Filetype ruby,eruby set sw=2
autocmd Filetype ruby,eruby set ts=2
" For Ruby Autocomplete
autocmd Filetype ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd Filetype ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd Filetype ruby,eruby let g:rubycomplete_rails = 1
autocmd Filetype html set softtabstop=2
autocmd Filetype html set sw=2
autocmd Filetype html set ts=2

" 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" KEYBINDING RELATED

" Change space to leader
nnoremap <space> <Nop>
let mapleader= " "

" Working with splits
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Working with Ruby methods
nmap W ]m
nmap B [m
nmap E ]M

" Working with buffers
nnoremap gb :ls<CR>:b<space>

" NerdTree stuff
nnoremap <leader>nt :NERDTreeToggle<Enter>

" FZF Key
nnoremap <leader>f :FZF<Enter>

" Wildmenus
set wildmenu
set wildmode=longest:list,full

" Line numbers
set number relativenumber
" Auto toggle
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Color and Theme
let g:seoul256_background = 234
colo seoul256

" Status lines
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" FZF Related Stuff
" Key Bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" - down / up / left / right
let g:fzf_layout = { 'left': '~20%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
