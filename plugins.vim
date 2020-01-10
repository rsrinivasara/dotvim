if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing vim-plug and plugins. Restart vim after finishing the process."
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'https://github.com/%s.git'

" file tree
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeTabsToggle', 'NERDTreeFind'] }

" commenting
Plug 'scrooloose/nerdcommenter'

" fuzzy file open
Plug 'kien/ctrlp.vim'

" code completion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang' }

" Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': './install.sh --clang-completer --system-libclang' }

augroup load_us_ycm
 autocmd!
 autocmd InsertEnter * call plug#load('YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

" git integration
Plug 'tpope/vim-fugitive'

" view git history and browse easily
Plug 'int3/vim-extradite'

" syntax checking on save
Plug 'scrooloose/syntastic'

" better looking statusline
Plug 'bling/vim-airline'

" plugin for visually displaying indent levels
" Plug 'Indent-Guides'

" color themes
" Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/seoul256.vim'
Plug 'godlygeek/csapprox'

" syntax support
Plug 'octol/vim-cpp-enhanced-highlight'

" visual undo tree
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'derekwyatt/vim-fswitch'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'myusuf3/numbers.vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'

call plug#end()
