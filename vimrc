set nocompatible              " be iMproved, required
filetype off                  " required

let hasVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let hasVundle=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible		" not compatible with the old-fashion vi mode
set backspace=2			" allow backspacing over everything in insert mode
set history=1000		" keep 1000 lines of command line history
set undolevels=100
set ruler				" show the cursor position all the time
set autoread			" auto read when file is changed from outside
set wrap
set linebreak
set linespace=0
set cursorline
set nofoldenable
set number
set numberwidth=4
set title
set showmode
set nobomb
set laststatus=2
set nostartofline
set splitright					" always open vertical split window in the right side
set splitbelow					" always open horizontal split window below"
set showtabline=2				" always show tab
set wildmenu					" make tab completion for files/buffers act like bash
set viminfo=					" disable .viminfo file

filetype on				" Enable filetype detection
filetype indent on		" Enable filetype-specific indenting
filetype plugin on		" Enable filetype-specific plugins

syntax on			" syntax highlight
set hlsearch
set incsearch		" incremental search
syntax enable

" Color scheme
set background=dark
set t_Co=256
colorscheme jellybeans

set nobackup		" no *~ backup files
set noswapfile
set nowb
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase

" Tab setting
set smarttab		" insert tabs on the start of a line according to context
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
au FileType Makefile set noexpandtab

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" utf-8 environment setting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set ambiwidth=double

" language convetions
autocmd FileType ruby,yaml set sw=2 sts=2 st=2

" omni complete setting
setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" cursorline switched while focus is switched to another split window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" ======================================
" custom key and plugin configurations
" ======================================

" force myself to not to use the error keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" tab settings
noremap <F7> gT<CR>
noremap <F8> gt<CR>

" cancel searched highlight
map ; :nohlsearch<CR>

" NERD Tree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 0
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" NERDcommenter
map <Leader><Leader> <Leader>c<space>

" Quickfix window, Ref: http://c9s.blogspot.tw/2007/10/vim-quickfix-windows.html
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win=bufnr("$")
  endif
endfunction
nnoremap <leader>q :QFix<CR>

" vim-airline
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
