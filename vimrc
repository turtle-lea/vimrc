" TODO
" - Yank line with number command. Practice it and will work
" - Silver search
" - Modificar silver search para que no te cierre la búsqueda después de abir
" - vim-rails
" - vim-fugitive
" - vim-surround
" - tmux+vim
" - Scroll in terminal => fn + shift + Up / fn + shift + Down
" - Compile vim with +clipboard
" - https://github.com/juanedi/predawn.vim
" - vim go shortcut opens silently. Oh yeah.
" - zz, z+, z-
" - orgmode.org
" - todo.txt
" - Probar read-only mode: -R
" - :set paste para pegar
" - :set nopaste para pegar
" - Commentary, nerdcommenter
" - Ctrl+V => Visual block, Shift insert insert => en el medio => Change en
"   todos los bloques
"   == hace autoindent
"   chequear filetype plugin descomentado

"**************************
" Mappings save and quit
"**************************
let mapleader = "\<Space>"
nnoremap - <nop>
let maplocalleader = "\-"
nnoremap <localleader>- dd
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap <leader><leader>q :q!<CR>
noremap <leader><leader>w :wq<CR>
nnoremap <leader>e :bd<CR>
inoremap jk <esc>
inoremap <esc> <nop>
vnoremap <esc> <esc><esc>
vnoremap <leader>j <esc><esc>
vnoremap <leader>i <esc><esc>i
nnoremap <CR> zz

"**************************
" General editing
"**************************
nnoremap <leader>no :noh<CR>
" What does this do?
" noremap <c-o> o<esc>
" It would be nice to extend this funcionality, to include visual blocks
nnoremap <leader>9 ddp
nnoremap <leader>0 ddkP
nnoremap W 4w
nnoremap J 4j
nnoremap <Down> 10j
nnoremap <Up> 10k
nmap <leader>l zz:echo @%<CR>
" When searching, advances and zz
nnoremap n nzz

"**************************
" Initial configuration
"**************************
" ruler has problems when scrolling up and down
" :set ruler
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
colorscheme predawn
set encoding=utf-8
set fileencoding=utf-8
set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start
set hlsearch

"**************************
" Mapping buffers
"**************************
" SPLIT
nnoremap <Tab> <c-w>w
nnoremap <leader>hid :hide<CR>

" buffer previous and next
nnoremap <leader><Tab> :bn<CR>
nnoremap <leader><leader><Tab> :bp<CR>

"**************************
" Syntax highlighting
"**************************
syntax on             " Enable syntax highlighting
filetype indent on    " Enable filetype-specific indenting
"filetype plugin on    " Enable filetype-specific plugins
runtime macros/matchit.vim

"**************************
" Mappings save and quit
"**************************
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

"**************************
" Registers
"**************************
vnoremap <leader>y "+y
" :nnoremap <leader>p :pu*<CR>
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <c-j> <nop>
vnoremap <c-j>y "jy
nnoremap <c-j>p "jp
nnoremap <c-j>P "jP
vnoremap <c-k> <nop>
vnoremap <c-k>y "ky
nnoremap <c-k>p :pu k<CR>ddk
vnoremap <c-l> <nop>
vnoremap <c-l>y "ly
nnoremap <c-l>p :pu l<CR>ddk
vnoremap <c-h> <nop>
vnoremap <c-h>y "hy
nnoremap <c-h>p :pu h<CR>ddk

"**************************
" Plugins
"**************************
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
call vundle#end()

" Disable autocomment
set formatoptions-=r
set formatoptions-=o
"
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"**************************
" tcomment
"**************************
let g:tcommentMapLeaderOp1 = '<leader>.'

"**************************
" NERDTree
"**************************
nnoremap <leader>nt :NERDTree<CR>

function Numbers()
  " relative line number / normal line number toggle
  if &relativenumber
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

function Cursors()
  set cursorline!
  set cursorcolumn!
endfunction 

nnoremap <Leader>cur :call Cursors()<cr>
nnoremap <Leader>num :call Numbers()<cr>

nnoremap <leader>vi :vsplit<cr><c-w>w:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"**************************
" Abbreviations
"**************************
iabbrev jjj jk
iabbrev waht what
iabbrev tehn then
iabbrev @1 lmatayoshi@manas.com.ar
iabbrev @2 leandro.matayoshi@gmail.com
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" o<esc>i"<esc>gvo<esc>i"<esc>

:autocmd FileType python :iabbrev iff if:<left> 
:autocmd FileType javascript :iabbrev iff if ()<left>

"**************************
" Importing sources
"**************************
function LoadHtml()
  echo "Loading html"
  source ~/.vim/snippets/html.vim
  echo "Finish loading html"
endfunction
autocmd BufNewFile,BufRead *.html :call LoadHtml()

