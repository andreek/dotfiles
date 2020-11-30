" ------------------------------------------------------------------------------
" Basics
" ------------------------------------------------------------------------------
" Be IMproved
set nocompatible
" Recognize file types / set indent mode
filetype plugin indent on
" Share OS clipboard
set clipboard=unnamed
" Allow mouse usage in terminal vim
set mouse=a
" Per project vimrc
set exrc
" Source vimrc files after editing
autocmd bufwritepost .vimrc source <afile>
" Indention
set autoindent
" Automatically safe files when switchin between them / leaving vim
set autowriteall
autocmd FocusLost * silent! :wa
autocmd TabLeave * silent! :wa
" Do not create swap files, we're using git after all
set nobackup
set nowritebackup
set noswapfile
" Enable vim to remember undo chains between sessions (vim 7.3)
if v:version >= 703
  set undofile
  set undodir="~/.vim/undo"
endif
set completeopt=menuone,longest
" Ignore certain things
set wildignore+=.git,*/node_modules/*
if !has('nvim')
    set ttymouse=xterm2
endif
set foldlevel=9999

" ------------------------------------------------------------------------------
" Syntastic
" ------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'


" ------------------------------------------------------------------------------
" Powerline
" ------------------------------------------------------------------------------
set rtp+=~/.vim/pack/dev/start/powerline/powerline/bindings/vim
let g:powerline_pycmd = 'py3'
let g:Powerline_symbols = 'fancy'
set laststatus=2
set showtabline=2
set noshowmode

" ------------------------------------------------------------------------------
" Styling
" ------------------------------------------------------------------------------
" Syntax highlighting
syntax on
" Color Scheme
colorscheme gruvbox
" Show Line numbers
set number
" Visual line marking 80 characters (vim 7.3)
if v:version >= 703
  set colorcolumn=80
endif
set list
" Highlight active line
set cursorline
hi CursorLine cterm=none
" Highlight search results
set hlsearch
" Invisible characters
autocmd BufEnter * set listchars=tab:▸\ ,eol:¬

" ------------------------------------------------------------------------------
" Tabs vs. Spaces
" ------------------------------------------------------------------------------
" Spaces instead of tabs
set expandtab
" 2 spaces for each tab
set tabstop=2
"" 2 spaces for indention
set shiftwidth=2
" ------------------------------------------------------------------------------
" fugitive.vim
" ------------------------------------------------------------------------------
nnoremap <Leader>s :G<CR>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>h :Glog<CR>


" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------
" Nerd Tree (toggle)
nnoremap <Leader>n :NERDTreeToggle<CR>
" Nerd Tree (reveal current file)
nnoremap <Leader>f :NERDTreeFind<CR>
" Close NERDtree when selecting a file
let NERDTreeQuitOnOpen=1

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let g:NERDTreeWinSize=40

" ------------------------------------------------------------------------------
" Key bindings
" ------------------------------------------------------------------------------
" Edit user .vimrc
nmap <Leader>v :e ~/.vimrc<CR>
" Edit project .vimrc
map <Leader>V :e .vimrc<CR>
" Edit project .env
map <Leader>C :e .env<CR>
" Clear search results when hitting space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Copy path to current buffer into clipboard
nnoremap <leader><space> :!echo -n % \| xclip -selection clipboard<CR><CR>

let g:jsx_ext_required = 0

" ------------------------------------------------------------------------------
" File type specifics
" ------------------------------------------------------------------------------
" Execute current file with node.js
autocmd BufEnter *.js nmap <Leader><Leader> :w<CR>:!node %:p<CR>
" Execute related jest tests with current file
autocmd BufEnter *.js nmap <Leader>t :w<CR>:!npx jest --verbose --findRelatedTests %:p<CR>
" Execute eslint fix with current file
autocmd BufEnter *.js nmap <Leader>e :w<CR>:!npx eslint --fix %:p<CR>:e!<CR>
" Execute current file with python
autocmd BufEnter *.py nmap <Leader><Leader> :w<CR>:!python %:p<CR>

autocmd BufEnter *.json set filetype=json

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Super replace
command! -nargs=* Argdo noautocmd silent argdo <args>
