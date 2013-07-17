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
" 自動インデント
set autoindent
" モード表示
set showmode
" 大文字小文字無視
set ignorecase
set showmatch
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
" set background=dark
" color
color koehler 

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
	
	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
	"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
	"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplcache_enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplcache_enable_insert_char_pre = 1
	
	" AutoComplPop like behavior.
	"let g:neocomplcache_enable_auto_select = 1
	
	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplcache_enable_auto_select = 1
	"let g:neocomplcache_disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
	"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
	
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

" ----------------------------------------------
" NeoBundle Setting
" ----------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'snipMate'

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


""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on   " required!
filetype indent on
syntax on

" --------------------------------------------
" Settin Dict
" --------------------------------------------
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
