" Auto setup ----- {{{
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif " }}}


" Plugins {{{
call plug#begin(expand('~/.vim/plugged'))

" Basics setup
Plug 'tpope/vim-sensible'
Plug 'zhimsel/vim-stay'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'

" Files
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'rickhowe/diffchar.vim'

" Coding
Plug 'xavierd/clang_complete'
Plug 'dense-analysis/ale'
Plug 'psf/black'
let g:black_virtualenv="~/.vim_black"

" Folding
Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'

" Completion
Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'

" Utility
Plug 'brooth/far.vim'

" Colors / interface
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'

call plug#end() " }}}

" General setup
set gdefault
set smartcase
set ignorecase
set showmatch
set nostartofline
set fileencoding=utf-8
set linebreak
set lazyredraw
set hidden
set splitright
set path+=**
set fillchars+=vert:\│
set pumheight=15
set grepprg=rg\ --vimgrep
set tagcase=smart

" Get rid of swapfiles. Use undo
set noswapfile
set nobackup
set nowritebackup
silent !mkdir ~/.vim_undo > /dev/null 2>&1
set undodir=~/.vim_undo
set undofile

" Indents
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set breakindent
set smartindent
set nofoldenable

" Completion ---- {{{
set noinfercase
" The following line assumes `brew install llvm` in macOS
" let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_library_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'
let g:clang_user_options = '-std=c++14'
let g:clang_complete_auto = 1
"
set completeopt+=menuone
set completeopt+=noinsert
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1
set completeopt-=preview
set completeopt+=longest,menuone,noselect
let g:jedi#popup_on_dot = 0  " It may be 1 as well
" }}}

" Recommended by Vim stay
set viewoptions=cursor,folds,slash,unix

" Mappings
let mapleader=","
let maplocalleader=","
map <c-s> :w<cr>
map <leader>f :Files<cr>
map <leader>b :Buffers<cr>
nmap <c-p> :Files<cr>

" Colorschemes
" colorscheme afterglow
colorscheme PaperColor
set cursorline

" Terminal Stuff -- TODO: Fix this up
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


" Allow per project vimrc
set exrc
set secure


" vim: set fdm=marker
