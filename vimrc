syntax on
execute pathogen#infect()
set rtp+=~/.fzf

filetype plugin indent on
syntax on
colorscheme default
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set wildmenu
set wildmode=longest:full,full
set undodir=$HOME/.vim/undo
set undofile
set showcmd
set clipboard=unnamedplus
set number
set relativenumber

set laststatus=2
highlight StatusLine cterm=None ctermbg=DarkGrey ctermfg=White

" white and grey line numbers
highlight LineNr ctermfg=DarkGrey
highlight CursorLineNr ctermfg=Yellow

" jump to last position
if has("autocmd")
	:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
endif

" split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" printf to/from fprintf
map <F2> If<Esc>wastderr, <Esc>
map <F3> 0wxwldwdw

" map tabs
let mapleader = "\<Space>" 
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" run as python code
" noremap <leader>p :w !python<CR>

" open .cc/.hh
set wildcharm=<tab>
map <leader>c :vs <C-r>=expand('%:p')<CR><BS><BS>c<tab><CR>
map <leader>h :vs <C-r>=expand('%:p')<CR><BS><BS>h<tab><CR>

" open .log/.log.err
map <leader>l :vs <C-r>=expand('%:p')<CR><BS><BS><BS><BS><CR>
map <leader>e :vs <C-r>=expand('%:p')<CR>.err<CR>

" goto file with vertical split
nnoremap <C-w>f <C-w>f<C-w>L

"""""""""""
" Plugins "
"""""""""""

" tagbar  vim-sneak  vim-surround fzf.vim fzf-mru.vim

" tagbar
nmap <F8> :TagbarToggle<CR>

" sneak
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" fzf.vim
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>r :Rg<space>
let g:fzf_layout = { 'down': '~30%' }

" fzf-mru.vim
nnoremap <silent> <leader>m :FZFMru<CR>
