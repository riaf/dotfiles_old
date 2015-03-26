NeoBundle 'buftabs'

let g:buftabs_only_basename=1 " ファイル名だけ表示
" let g:buftabs_in_statusline=1 " ステータスラインに表示
noremap <Space>n :bnext<CR>
noremap <Space>p :bprev<CR>
nmap <C-h> <C-w>h " Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l でウィンドウ間を移動
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

