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

