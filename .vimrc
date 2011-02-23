""
" どこかから拾ってきたものばかり！

""
" call pathogen
call pathogen#runtime_append_all_bundles()

syntax on
set bs=indent,eol,start

set nobackup
set expandtab
set tabstop=4
set number
set title
set shiftwidth=4
set autoindent
set hlsearch
set modeline
set smartindent
set smarttab
set hidden
set swapfile

autocmd BufNewFile,BufRead *.twig setfiletype htmldjango


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
" vim-ref
let g:ref_phpmanual_path = $HOME . '/.doc/php'
" 常人にはおすすめできない
noremap <C-M> :Unite ref/phpmanual<CR>


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
set statusline+=\ %{strftime('%c')}  " 時間
set statusline+=%4l,%2c " 行、列
set statusline+=%3p%%   " どこにいるか
set statusline+=%<      " 折り返しの指定


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


" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにす
if exists('&ambiwidth')
  set ambiwidth=double
endif

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

