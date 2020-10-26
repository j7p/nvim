set number
set modifiable 

set showmatch
set visualbell
 
set hlsearch
set smartcase
set ignorecase
set incsearch
 
set autoindent
set shiftwidth=4
set smartindent
set smarttab	
set softtabstop=4
 
set ruler	
set undolevels=1000
"set guifont=Consolas:h18


call plug#begin('~/.config/nvim/bundle')

" Make sure you use single quotes
Plug 'tpope/vim-surround' 
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'preservim/nerdcommenter'
"Plug 'jupyter-vim/jupyter-vim'
" Initialize plugin system
"Plug 'valloric/youcompleteme'

Plug 'vim-syntastic/syntastic'

"Plug 'nvie/vim-flake8'

Plug 'kien/ctrlp.vim'

"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'rafi/awesome-vim-colorschemes'

Plug 'voldikss/vim-floaterm'

"Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'

Plug 'airblade/vim-gitgutter'
set updatetime=100

"Plug 'nvie/vim-flake8'

call plug#end()

set backspace=indent,eol,start  " more powerful backspacing
"set guifont=Monaco:h20
"set pythonthreedll=python37.dll
"set pythonthreehome=C:\Python37


"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:airline_statusline_ontop=1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='ayu_dark'

syntax enable
colorscheme jellybeans 
"set background=dark
"colorscheme hybrid

"tnoremap <C-;> <C-\><C-n>
tnoremap jk <C-\><C-n>
imap jk <Esc>

nnoremap <leader>tt :call OpenTermTab()<CR>
nnoremap <leader>tr :call OpenTermRight()<CR>


" Trigger configuration. You need to change this to something else than <tab>
" if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

map <C-n> :NERDTreeToggle<CR>

"autocmd BufWritePost *.py call flake8#Flake8()
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)

if executable('ag') 
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
    endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>




fun! OpenTermTab()
    let current_dir = expand("%:p:h")
    :execute ":tabe"
    :execute ":term"
    call feedkeys("acd \"".current_dir."\"\<CR>")
    call feedkeys("clear"."\<CR>")
endfun

fun! OpenTermRight()
let current_dir = expand("%:p:h")
    :execute ":bo 50vs"
    :execute ":term"
    call feedkeys("acd \"".current_dir."\"\<CR>")
    call feedkeys("clear"."\<CR>")
endfun

