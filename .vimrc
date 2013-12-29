set nocompatible

" ----------------------------------------------
" NeoBundle Setting
" ----------------------------------------------
if has('vim_starting') 
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
  filetype plugin on
  filetype indent on
  
  " NERDTree
  autocmd VimEnter * NERDTree ./
endif

autocmd!

"  自動インデント
set autoindent
" 行番号
set number
" タブ数(基本的に使わない
set tabstop=4
set expandtab
" タブ入力時のスペース数
set softtabstop=4
" 自動インデント時のタブ数
set shiftwidth=4
" モード表示
set showmode
" 大文字小文字無視
set ignorecase
set showmatch

" marker
set foldmethod=marker
" シンタックスハイライト
syntax on
" タイプ途中のコマンド表示
set showcmd
" 検索語を強調表示
set hlsearch
" ビープ代わりにビジュアルベルを使う
set visualbell
" タイトル
set title
" ルーラー表示
set ruler
" バックアップ生成しない
set nobackup
" ペースト時にずれないようにする(neocomplcacheを利用するには無効にする)
" set paste
" 背景色
set background=dark

"" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
	
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ポップアップメニューの色
" ポップアップメニューの背景色
" highlight Pmenu ctermbg=lightgray ctermfg=blue
"highlight Pmenu guibg=#666666
"highlight PmenuSel guibg=#8cd0d3 guifg=#666666
"highlight PmenuSbar guibg=#333333

" ------------------------------------------
" Setting Keymap 
" ------------------------------------------

" cursel
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" reload .vimrc
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" Set augroup.
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
                \if has('gui_running') | source $MYGVIMRC  
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

" ------------------------------------------
" template setting
" ------------------------------------------

" htmlファイル作成時にテンプレートを使用する
augroup SkeletonAu
	autocmd!
	autocmd BufNewFile *.html 0r $HOME/.vimfiles/templates/skel.html
	autocmd BufNewFile *.c 0r $HOME/.vimfiles/templates/skel.c
augroup END
"-----------------------------------------
"  autocmd setting
"-----------------------------------------
autocmd FileType * setlocal formatoptions-=ro


" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'snipMate'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'myusuf3/numbers.vim'
nnoremap <C-r> :NumbersToggle<CR>

" color-scheme
NeoBundle 'altercation/solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" NERDTREE
NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2

" Tabular
NeoBundle 'godlygeek/tabular'

" JS
NeoBundle 'JavaScript-syntax'
NeoBundle 'vim-javascript'

" JS Indent
NeoBundle 'http://github.com/jiangmiao/simple-javascript-indenter.git'
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1


" node.js
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'jamescarr/snipmate-nodejs'

" HTML5
NeoBundle 'html5.vim'

" PHP
NeoBundle 'PDV--phpDocumentor-for-Vim'


""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on   " required!
filetype indent on
syntax on

" --------------------------------------------
" Settin Dict
" --------------------------------------------
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict


" --------------------------------------------
" Setting Python 
" --------------------------------------------
autocmd FileType python setlocal autoindent
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" --------------------------------------------
" Setting PHP
" --------------------------------------------
"  phpDocumentor
inoremap <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocSingle()<CR>
