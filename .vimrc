""
" neobundle setting
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/neobundle/

    call neobundle#rc(expand('~/.vim/bundle'))
endif

" My Bundles:
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vim-vcs'
NeoBundle 'Shougo/vimshell'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'buftabs'
NeoBundle 'Align'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'taxilian/VimDebugger'
" NeoBundle 'php_localvarcheck.vim'

filetype plugin on
filetype indent on


""
" 寄せ集めの vimrc

syntax on
set bs=indent,eol,start

set nobackup
set expandtab
set tabstop=2
set number
set title
set shiftwidth=2
set autoindent
set hlsearch
set modeline
set smartindent
set smarttab
set hidden
set noswapfile
set encoding=utf-8

" 対応するカッコの強調表示をやめる
" let loaded_matchparen = 1

" color scheme
" let g:solarized_termcolors=256
let g:solarized_termcolors=256
" set background=dark
colorscheme solarized

autocmd BufNewFile,BufRead *.twig setfiletype htmldjango
autocmd BufNewFile,BufRead *.md setfiletype markdown

au FileType php setl sw=4 sts=4 et
au FileType mkd setl sw=4 sts=4 et


""
" neocomplcache
""
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_underbar_completion = 1


""
" vimfiler
let g:vimfiler_as_default_explorer = 1


""
" vim-ref
let g:ref_phpmanual_path = $HOME . '/.doc/php'
" 常人にはおすすめできない
noremap <Space>h :Unite ref/phpmanual<CR>


"
" Status Line
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
set statusline+=%{vcs#info('(%s)-[%b]','(%s)-[%b\|%a]')}
set statusline+=%<      " 折り返しの指定


""
" vim-vcs
let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'


""
" align php
noremap = :Align=><CR>


""
" buftabs
let g:buftabs_only_basename=1 " ファイル名だけ表示
let g:buftabs_in_statusline=1 " ステータスラインに表示
noremap <Space>n :bnext<CR> " Space, Shift+Space でバッファを切り替え
noremap <Space>p :bprev<CR>
nmap <C-h> <C-w>h " Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l でウィンドウ間を移動
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k


""
" unite.vim
"
" based http://blog.remora.cx/2010/12/vim-ref-with-unite.html

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
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


""
" unite-outline
noremap <C-O> :Unite outline<CR>


""
" quickrun
let g:quickrun_config = {}
let g:quickrun_config['mkd'] = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser'
      \ }


""
" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""
" php-xdebug
map <F11> :DbgStepInto<CR>
map <F10> :DbgStepOver<CR>
map <S-F11> :DbgStepOut<CR>
map <F5> :DbgRun<CR>
map <S-F5> :DbgDetach<CR>
map <F8> :DbgToggleBreakpoint<CR>

""
" from sotarok
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline

noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

set list
set listchars=tab:>.,trail:-,nbsp:%,extends:>,precedes:<
highlight SpecialKey term=underline ctermfg=darkcyan guifg=darkcyan

highlight IdeographicSpace term=underline ctermbg=LightCyan guibg=LightCyan
autocmd VimEnter,WinEnter * match IdeographicSpace /　/

nnoremap <Space>w :<C-u>write<CR>


" 文字コードの自動認識
" if &encoding !=# 'utf-8'
"   set encoding=japan
"   set fileencoding=japan
" endif
" if has('iconv')
"   let s:enc_euc = 'euc-jp'
"   let s:enc_jis = 'iso-2022-jp'
"   " iconvがeucJP-msに対応しているかをチェック
"   if iconv("¥x87¥x64¥x87¥x6a", 'cp932', 'eucjp-ms') ==# "¥xad¥xc5¥xad¥xcb"
"     let s:enc_euc = 'eucjp-ms'
"     let s:enc_jis = 'iso-2022-jp-3'
"   " iconvがJISX0213に対応しているかをチェック
"   elseif iconv("¥x87¥x64¥x87¥x6a", 'cp932', 'euc-jisx0213') ==# "¥xad¥xc5¥xad¥xcb"
"     let s:enc_euc = 'euc-jisx0213'
"     let s:enc_jis = 'iso-2022-jp-3'
"   endif
"   " fileencodingsを構築
"   if &encoding ==# 'utf-8'
"     let s:fileencodings_default = &fileencodings
"     let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"     let &fileencodings = &fileencodings .','. s:fileencodings_default
"     unlet s:fileencodings_default
"   else
"     let &fileencodings = &fileencodings .','. s:enc_jis
"     set fileencodings+=utf-8,ucs-2le,ucs-2
"     if &encoding =~# '^¥(euc-jp¥|euc-jisx0213¥|eucjp-ms¥)$'
"       set fileencodings+=cp932
"       set fileencodings-=euc-jp
"       set fileencodings-=euc-jisx0213
"       set fileencodings-=eucjp-ms
"       let &encoding = s:enc_euc
"       let &fileencoding = s:enc_euc
"     else
"       let &fileencodings = &fileencodings .','. s:enc_euc
"     endif
"   endif
"   " 定数を処分
"   unlet s:enc_euc
"   unlet s:enc_jis
" endif
" " 日本語を含まない場合は fileencoding に encoding を使うようにする
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^¥x01-¥x7e]", 'n') == 0
"       let &fileencoding=&encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif


" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにす
if exists('&ambiwidth')
  set ambiwidth=double
endif

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

