" Include the system settings
:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif

" Include Arista-specific settings
:if filereadable( $VIM . "/vimfiles/arista.vim" )
   source $VIM/vimfiles/arista.vim
:endif

" Put your own customizations below
set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run install script if you use fzf only in Vim.
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'

call plug#end()

set autoindent
set expandtab
set sw=3
set ts=3

" Sets python code folding
autocmd FileType python setlocal foldmethod=indent

" SEARCH RELATED
set incsearch
set hlsearch " Highlights any search matches
" :grep now doesn't leave vim and also doesn't open the first file match
command! -nargs=+ Grep execute 'silent grep! <args>' | copen

" KEYBINDING RELATED

" Set Paste Toggle
set pastetoggle=<F3>

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
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

" Defines default behavior for where splits go to
set splitbelow
set splitright

" Working with buffers
nnoremap gb :ls<CR>:b<space>

" Working with GREP RESULTS
" Show the quickfix window
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
" Navigating through the results
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

" Working with diffs
nnoremap <leader>df :windo diffthis<Enter>
nnoremap <leader>dF :windo diffoff<Enter>

" NerdTree stuff
nnoremap <leader>nt :NERDTreeToggle<Enter>
" Fix first character removed error in lnxsrv since Vim 7.4
let NERDTreeNodeDelimiter = "\t"

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

" Copying curr file into buffer
nnoremap <leader>cp :!xclip -sel clip -i %<Enter>

" THEME / COLOR RELATED

" 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

" Color and Theme
"let g:seoul256_background = 234
set bg=dark
colo gruvbox

" Status lines
set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
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

" Visual aid for 80 characters
set colorcolumn=80

" Working with HTML and Webdev
let g:user_emmet_leader_key=','
