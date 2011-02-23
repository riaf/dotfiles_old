""
" どこかから拾ってきたものばかり！

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

