set tags=./tags,tags;
set completeopt=menu,menuone
" Limit popup menu height
set pumheight=20

"------------------------------------------------------------------------------
" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"------------------------------------------------------------------------------
" Multiplecursors
let g:multi_cursor_use_default_mapping = 1

"------------------------------------------------------------------------------
" nerdtree
" Ctrl-P to Display the file browser tree
nmap <C-P> :NERDTreeTabsToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>
let g:nerdtree_tabs_open_on_gui_startup = 0

"------------------------------------------------------------------------------
" nerdcommenter
" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

"------------------------------------------------------------------------------
" yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" ,y to show the yankring
nmap <leader>y :YRShow<cr>
" put the yankring_history file in ~/.backup
let g:yankring_history_dir = '~/.backup'

"------------------------------------------------------------------------------
" Fugitive
" ,g for Ggrep
" nmap <leader>g :silent Ggrep<space>

" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>

" same in visual mode
:vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

"------------------------------------------------------------------------------
" Ack
" ,g for Ack
" ,k for Ack current word
" TODO: make it smart and combine it
nmap <leader>g :Ack<space>
nmap <leader>k :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:Ack "<C-R><C-W>"<space>

"------------------------------------------------------------------------------
" indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5

"------------------------------------------------------------------------------
" Gundo
nmap <leader>u :GundoToggle<CR>
let g:gundo_close_on_revert = 1

"------------------------------------------------------------------------------
" Airline
let g:airline_powerline_fonts=1
" let g:airline_theme='base16'

"------------------------------------------------------------------------------
" Tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_autoclose = 1
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 0
nnoremap <leader>t :TagbarToggle<CR>

"------------------------------------------------------------------------------
" Ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" let g:ycm_seed_identifiers_with_syntax = 1
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_path_to_python_interpreter = '/usr/bin/python2.7'
let g:ycm_server_log_level = 'info'
let g:pymode_breakpoint = 0
let g:pymode_rope_vim_completion = 0

"------------------------------------------------------------------------------
" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"------------------------------------------------------------------------------
" Tabularize
if exists(":Tabularize")
  nmap <Leader>af :Tabularize /\v(\S+\s\=\s)*\S+[,)].*$/l1<CR>
  vmap <Leader>af :Tabularize /\v(\S+\s\=\s)*\S+[,)].*$/l1<CR>
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
endif

"------------------------------------------------------------------------------
" vim-fswitch - Easily switch between header and cpp files
nmap <Leader>fh :FSHere<CR>
nmap <Leader>fl :FSLeft<CR>
nmap <Leader>fr :FSRight<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

"------------------------------------------------------------------------------
" unite
" Fuzzy matching for plugins not using matcher_default as filter
call unite#custom#source('outline,line,grep,session', 'matchers', ['matcher_fuzzy'])

" Ignore some things
" KEEP THESE IN SYNC WITH WILDIGNORE!
" Need to escape dots in the patterns!
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.swp', '\.swo', '\~$',
            \ '\.git/', '\.svn/', '\.hg/',
            \ '^tags$', '\.taghl$',
            \ '\.ropeproject/',
            \ 'node_modules/', 'log/', 'tmp/', 'obj/',
            \ '/vendor/gems/', '/vendor/cache/', '\.bundle/', '\.sass-cache/',
            \ '/tmp/cache/assets/.*/sprockets/', '/tmp/cache/assets/.*/sass/',
            \ 'thirdparty/', 'Debug/', 'Release/',
            \ '\.pyc$', '\.class$', '\.jar$',
            \ '\.jpg$', '\.jpeg$', '\.bmp$', '\.png$', '\.gif$',
            \ '\.o$', '\.out$', '\.obj$', '\.rbc$', '\.rbo$', '\.gem$',
            \ '\.zip$', '\.tar\.gz$', '\.tar\.bz2$', '\.rar$', '\.tar\.xz$'
            \ ], '\|'))

let g:unite_source_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'max_candidates', 0)

" Keep track of yanks
let g:unite_source_history_yank_enable = 1
" Prettier prompt
call unite#custom#profile('default', 'context', {
    \   'prompt': '» ',
    \   'start_insert': 1,
    \   'update_time': 200,
    \   'cursor_line_highlight': 'UniteSelectedLine',
    \   'direction': 'botright',
    \   'prompt_direction': 'top',
    \ })
" Autosave sessions for unite-sessions
let g:unite_source_session_enable_auto_save = 1
" Non-ugly colors for selected item, requires you to set 'hi UnitedSelectedLine'
let g:unite_cursor_line_highlight = "UniteSelectedLine"
" Set to some better time formats
let g:unite_source_buffer_time_format = "%Y-%m-%d  %H:%M:%S  "
let g:unite_source_file_mru_time_format = "%Y-%m-%d  %H:%M:%S  "

" Use ag or ack as grep command if possible
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-case --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
              \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

function! g:DoUniteFuzzy()
    call unite#custom#source('file_rec/async,file/new', 'sorters', 'sorter_rank')
    call unite#custom#source('file_rec/async,file/new', 'converters', 'converter_relative_word')
    call unite#custom#source('file_rec/async,file/new', 'matchers', 'matcher_fuzzy')
    exec "Unite -buffer-name=files file_rec/async file/new"
endfunction
function! g:DoUniteNonFuzzy()
    call unite#custom#source('file_rec/async,file/new', 'sorters', 'sorter_nothing')
    call unite#custom#source('file_rec/async,file/new', 'converters', 'converter_relative_word')
    call unite#custom#source('file_rec/async,file/new', 'matchers', 'matcher_glob')
    exec "Unite -buffer-name=files file_rec/async file/new"
endfunction
function! g:DoUniteFuzzyQuickfix()
    call unite#custom#source('quickfix', 'sorters', 'sorter_rank')
    call unite#custom#source('quickfix', 'matchers', 'matcher_fuzzy')
    exec "Unite -buffer-name=quickfix quickfix"
endfunction
function! g:DoUniteNonFuzzyQuickfix()
    call unite#custom#source('quickfix', 'sorters', 'sorter_nothing')
    call unite#custom#source('quickfix', 'matchers', 'matcher_glob')
    exec "Unite -buffer-name=quickfix quickfix"
endfunction
function! UltiSnipsCallUnite()
    Unite -immediately -no-empty -vertical -buffer-name=ultisnips ultisnips
    return ''
endfunction

" Bindings
inoremap <silent><leader>l<tab> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent><leader>l<tab> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent><leader>lr :call g:DoUniteFuzzy()<CR>
nnoremap <silent><leader>lR :call g:DoUniteNonFuzzy()<CR>
nnoremap <silent><leader>lq :call g:DoUniteFuzzyQuickfix()<CR>
nnoremap <silent><leader>lQ :call g:DoUniteNonFuzzyQuickfix()<CR>
nnoremap <silent><leader>le :<C-u>Unite -buffer-name=files file_mru bookmark<CR>
nnoremap <silent><leader>lE :<C-u>Unite -buffer-name=files file_mru bookmark file_rec/async file/new<CR>
nnoremap <silent><leader>lB :<C-u>Unite -buffer-name=buffers buffer<CR>
nnoremap <silent><leader>lb :<C-u>Unite -buffer-name=buffers buffer_tab<CR>
nnoremap <silent><leader>ly :<C-u>Unite -buffer-name=yanks history/yank<CR>
nnoremap <silent><leader>lc :<C-u>Unite -buffer-name=changes change<CR>
nnoremap <silent><leader>lj :<C-u>Unite -buffer-name=jumps jump<CR>
nnoremap <silent><leader>lf :<C-u>Unite -buffer-name=jumps jump<CR>
nnoremap <silent><leader>l; :<C-u>Unite -buffer-name=commands history/command<CR>
nnoremap <silent><leader>l/ :<C-u>Unite -buffer-name=commands history/search<CR>
nnoremap <silent><leader>lo :<C-u>Unite -buffer-name=outline outline<CR>
nnoremap <silent><leader>la :<C-u>Unite -buffer-name=outline -vertical outline<CR>
nnoremap <silent><leader>ll :<C-u>Unite -buffer-name=line line<CR>
nnoremap <silent><leader>lw :<C-u>Unite -buffer-name=location_list location_list<CR>
nnoremap <silent><leader>l* :<C-u>UniteWithCursorWord -buffer-name=line line<CR>
nnoremap <silent><leader>lg :<C-u>Unite -buffer-name=grep grep<CR>
nnoremap <silent><leader>ls :<C-u>Unite session<CR>
nnoremap <silent><leader>lt :<C-u>Unite -buffer-name=tags tag tag/file<CR>
nnoremap <silent><leader>li :<C-u>Unite -buffer-name=included_tags tag/include<CR>
nnoremap <silent><leader>ld :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru directory<CR>
nnoremap <silent><leader>l, :<C-u>UniteResume<CR>
nnoremap <silent><leader>lv :<C-u>UniteResume<CR>
nnoremap <silent><leader>lV :<C-u>UniteResume 

nnoremap <leader>lS :<C-u>UniteSessionSave 

function! s:unite_my_settings()
  "Don't add parens to my filters
  let b:delimitMate_autoclose = 0

  "Keymaps inside the unite split
  nmap <buffer> <nowait> <leader>d <Plug>(unite_exit)
  nmap <buffer> <nowait> <C-c> <Plug>(unite_exit)
  imap <buffer> <nowait> <C-c> <Plug>(unite_exit)

  nnoremap <buffer> <C-n> <Plug>(unite_select_next_line)
  nnoremap <buffer> <C-p> <Plug>(unite_select_previous_line)

  nnoremap <buffer> <Up> 3<c-y>
  nnoremap <buffer> <Down> 3<c-e>
  inoremap <buffer> <Up> <esc>3<c-y>
  inoremap <buffer> <Down> <esc>3<c-e>

  inoremap <silent><buffer><expr> <C-j> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-j> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-k> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-k> unite#do_action('vsplit')
endfunction

if has("autocmd")
augroup UniteSettingsGroup
    " Clear autocmds for this group
    autocmd!

    autocmd FileType unite call s:unite_my_settings()
augroup end
endif
