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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" commenting
Plug 'scrooloose/nerdcommenter', { 'on': 'NERDComAlignedComment' }

" fuzzy file open
" Plug 'kien/ctrlp.vim'

" code completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

" snippet engine
Plug 'SirVer/ultisnips'

" Yank ring browser
Plug 'YankRing.vim'

" git integration
Plug 'tpope/vim-fugitive'

" view git history and browse easily
Plug 'int3/vim-extradite'

" syntax checking on save
Plug 'scrooloose/syntastic'

" better looking statusline
Plug 'bling/vim-airline'

" plugin for visually displaying indent levels
Plug 'Indent-Guides'

" color themes
" Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'
Plug 'godlygeek/csapprox'

" syntax support
Plug 'octol/vim-cpp-enhanced-highlight'

" visual undo tree
Plug 'sjl/gundo.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'myusuf3/numbers.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

call plug#end()
