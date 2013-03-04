" ==============================================================================
" vimrc
"
" - 基本的にあちこちから寄せ集めたもの
" ==============================================================================

" ------------------------------------------------------------------------------
" neobundle setting: "{{{

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/neobundle/

    call neobundle#rc(expand('~/.vim/bundle'))
endif

set fileformat=unix

" My Bundles:
NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \     'windows' : 'make -f make_mingw32.mak',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }
" NeoBundle 'Shougo/git-vim'
" NeoBundle 'Shougo/vim-vcs'
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'larssmit/vim-lucius'
" NeoBundle 'mattn/benchvimrc-vim'
" NeoBundle 'php_localvarcheck.vim'
NeoBundle 'IndentAnything'
NeoBundle 'JSON.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Lucius'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Simple-Javascript-Indenter'
NeoBundle 'buftabs'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'docteurklein/php-getter-setter.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'heavenshell/unite-sf2'
NeoBundle 'jade.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jsx/jsx.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nginx.vim'
NeoBundle 'phpvim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'rgarver/Kwbd.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sudo.vim'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'taxilian/VimDebugger'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/operator-html-escape.vim'
NeoBundle 'ujihisa/shadow.vim'

filetype plugin on
filetype indent on

" }}}

" ------------------------------------------------------------------------------
" initialize: "{{{

" syntax highlight
syntax on
" backspace
set bs=indent,eol,start
" バックアップを取らない
set nobackup
" タブをスペースにする
set expandtab
" グローバルなタブ幅は2にしちゃう
set tabstop=2
" インデント幅
set shiftwidth=2
" 自動インデント
set autoindent
set smartindent
" タブ入力
set smarttab
" タブとかを可視化する
set list
set listchars=tab:>\ ,trail:~,nbsp:%,extends:>,precedes:<
" 行番号表示
set number
" タイトルを表示
set title
" 検索語ハイライト
set hlsearch
" モードライン有効
set modeline
set modelines=5
" 新しいバッファを開くときに警告しない
set hidden
" エンコードは utf-8 しか使わないし
set encoding=utf-8
" スワップファイルは /tmp に作る
set directory=/tmp
" 改行コードの自動認識
set fileformats=unix,dos,mac
" 検索時に大文字小文字を無視する
set ignorecase
" インクリメンタルサーチ
set incsearch
" コマンドラインの補完候補表示
set wildmenu
" folding を無効化する
set nofoldenable
" □とか○の文字があってもカーソル位置がずれないようにす
if exists('&ambiwidth')
  set ambiwidth=double
endif
" :TOHtml のために
let g:use_xhtml = 1
let g:html_use_css = 1
let g:html_no_pre = 1

" }}}

" ------------------------------------------------------------------------------
" autocmd: "{{{

  " filetype define
  autocmd BufNewFile,BufRead *.twig setfiletype htmldjango
  autocmd BufNewFile,BufRead *.md setfiletype markdown
  autocmd BufNewFile,BufRead *.json setfiletype json

  " カーソル行強調
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  autocmd BufEnter * setlocal cursorline
  autocmd BufLeave * setlocal nocursorline

  " 特殊文字、行末の半角スペースを強調
  highlight SpecialKey term=underline ctermfg=darkcyan guifg=darkcyan
  highlight IdeographicSpace term=underline ctermbg=LightCyan guibg=LightCyan
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
  highlight WhitespaceEOL ctermbg=red guibg=red
  match WhitespaceEOL /\s\+$/
  autocmd WinEnter * match WhitespaceEOL /\s\+$/

  " command window
  autocmd CmdwinEnter * call s:init_cmdwin()
  function! s:init_cmdwin()
    nnoremap <buffer> q :<C-u>quit<CR>
    nnoremap <buffer> <TAB> :<C-u>quit<CR>
    inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
    inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
    inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

    " Completion.
    inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    startinsert!
  endfunction

" }}}

" ------------------------------------------------------------------------------
" statusline: "{{{

set laststatus=2
set statusline=
set statusline+=[*%n]\  " バッファ番号
set statusline+=%f\     " ファイル名
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'} " 文字コード
set statusline+=%m      " バッファ状態[+]とか
set statusline+=%r      " 読み取り専用フラグ
set statusline+=%h      " ヘルプバッファ
set statusline+=%w      " プレビューウィンドウ
set statusline+=%=      " 区切り
set statusline+=\ %{strftime('%m\/%d\ %H:%M:%S')}  " 時間
set statusline+=%4l,%2c " 行、列
set statusline+=%3p%%   " どこにいるか
set statusline+=\       " 区切り
" set statusline+=%{vcs#info('(%s)-[%b]','(%s)-[%b\|%a]')}
set statusline+=%<      " 折り返しの指定

" }}}

" ------------------------------------------------------------------------------
" colorscheme: "{{{

" let g:solarized_termcolors=256
set background=dark
colorscheme lucius
" colorscheme solarized

" }}}

" ------------------------------------------------------------------------------
" mappings: "{{{

" save
nnoremap <Space>w :<C-u>write<CR>

" US キーだとこうなるよね
noremap ;  :
noremap :  ;

" [h, j, k, l] <-> [gh, gj, gk, gl]
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" gc で直前の編集行を選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" 選択したテキストの移動 (textmanip)
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)

" 行の複製 (textmanip)
vmap <M-d> <Plug>(textmanip-duplicate-down)
nmap <M-d> <Plug>(textmanip-duplicate-down)

" html-escape
vmap H <Plug>(operator-html-escape)

" unite-outline
noremap <C-O> :Unite outline<CR>

" 検索するときに / 打つだけで \/ になるように
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" command window を使う (see http://vim-users.jp/2010/07/hack161/ )
" nnoremap <sid>(command-line-enter) q:
" xnoremap <sid>(command-line-enter) q:
" nnoremap <sid>(command-line-norange) q:<C-u>
" nmap :  <sid>(command-line-enter)
" xmap :  <sid>(command-line-enter)

" align php
" noremap = :Align=><CR>

" php-manual
noremap <Space>h :Unite ref/phpmanual<CR>

" php-xdebug
map <F11> :DbgStepInto<CR>
map <F10> :DbgStepOver<CR>
map <S-F11> :DbgStepOut<CR>
map <F5> :DbgRun<CR>
map <S-F5> :DbgDetach<CR>
map <F8> :DbgToggleBreakpoint<CR>

" }}}

" ------------------------------------------------------------------------------
" plugins: "{{{

  "" buftabs: "{{{
    let g:buftabs_only_basename=1 " ファイル名だけ表示
    let g:buftabs_in_statusline=1 " ステータスラインに表示
    noremap <Space>n :bnext<CR>
    noremap <Space>p :bprev<CR>
    nmap <C-h> <C-w>h " Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l でウィンドウ間を移動
    nmap <C-l> <C-w>l
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
  " }}}

  "" neocomplcache: "{{{

    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_auto_select = 0
    let g:neocomplcache_enable_underbar_completion = 1

    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    " Enable heavy omni completion.
    " if !exists('g:neocomplcache_omni_patterns')
    "   let g:neocomplcache_omni_patterns = {}
    " endif
    " let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    " "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    " let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    " let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    " let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

  " }}} "neocomplcache
  "
  "" neosnippet: "{{{
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
  " }}} "neosnippet

  "" vimfiler: "{{{
    let g:vimfiler_as_default_explorer = 1
  " }}} "vimfiler

  "" vim-ref: "{{{
    let g:ref_phpmanual_path = $HOME . '/.doc/php'
  " }}} "vim-ref

  "" vim-vcs: "{{{
    let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
  " }}}

  "" unite.vim: "{{{
  "
  " based http://blog.remora.cx/2010/12/vim-ref-with-unite.html

    " 入力モードで開始する
    let g:unite_enable_start_insert=1
    " バッファ一覧
    noremap <C-P> :Unite buffer<CR>
    " ファイル一覧
    noremap <C-N> :Unite -buffer-name=files file file/new<CR>
    " 最近使ったファイルの一覧
    noremap <C-Z> :Unite file_mru<CR>
    " ウィンドウを分割して開く
    au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
    au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
    " ウィンドウを縦に分割して開く
    au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
    au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
    " ESCキーを2回押すと終了する
    au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
    au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
    " 初期設定関数を起動する
    au FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
      " Overwrite settings.
    endfunction
      " 様々なショートカット
    call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
    call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
    call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
    call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
    call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
    call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
    call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
    call unite#set_substitute_pattern('file', '^;v', '~/.vim/')

  " }}}

  "" quickrun: "{{{

    let g:quickrun_config = {}
    let g:quickrun_config['mkd'] = {
          \ 'type': 'markdown/pandoc',
          \ 'cmdopt': '-s',
          \ 'outputter': 'browser'
          \ }

  " }}}

  "" syntastic: "{{{

    let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html', 'less'] }
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_jump=1
    let g:syntastic_auto_loc_list=2
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

  " }}}

  "" Simple-Javascript-Indenter: "{{{
    let g:SimpleJsIndenter_BriefMode = 2
  " }}}

  "" vim-alignta: "{{{

    nnoremap [unite] <Nop>
    xnoremap [unite] <Nop>
    nmap f [unite]
    xmap f [unite]

    let g:unite_source_alignta_preset_arguments = [
          \ ["Align at '='", '=>\='],
          \ ["Align at ':'", '01 :'],
          \ ["Align at '|'", '|'   ],
          \ ["Align at ')'", '0 )' ],
          \ ["Align at ']'", '0 ]' ],
          \ ["Align at '}'", '}'   ],
          \]

    let s:comment_leadings = '^\s*\("\|#\|/\*\|//\|<!--\)'
    let g:unite_source_alignta_preset_options = [
          \ ["Justify Left",      '<<' ],
          \ ["Justify Center",    '||' ],
          \ ["Justify Right",     '>>' ],
          \ ["Justify None",      '==' ],
          \ ["Shift Left",        '<-' ],
          \ ["Shift Right",       '->' ],
          \ ["Shift Left  [Tab]", '<--'],
          \ ["Shift Right [Tab]", '-->'],
          \ ["Margin 0:0",        '0'  ],
          \ ["Margin 0:1",        '01' ],
          \ ["Margin 1:0",        '10' ],
          \ ["Margin 1:1",        '1'  ],
          \
          \ 'v/' . s:comment_leadings,
          \ 'g/' . s:comment_leadings,
          \]
    unlet s:comment_leadings

    nnoremap <silent> [unite]a :<C-u>Unite alignta:options<CR>
    xnoremap <silent> [unite]a :<C-u>Unite alignta:arguments<CR>

  " }}}

" }}}

" vim: foldmethod=marker
