source ~/.vim/plugins.vim
source ~/.vim/global.vim
source ~/.vim/bindings.vim
source ~/.vim/plugin-config.vim

if !has('gui_running')
    " All themes are installed by now
    syntax enable
    set background=dark
    colorscheme atom-dark-256

    set fillchars+=vert:\|
    hi! VertSplit ctermfg=bg ctermbg=fg term=NONE
end

if has('gui_running')
    source ~/.vim/gvimrc
end
