" 検索語ハイライト
set hlsearch
" 検索時に大文字小文字を無視する
set ignorecase
" インクリメンタルサーチ
set incsearch
" コマンドラインの補完候補表示
set wildmenu

cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

