NeoBundle 'thinca/vim-quickrun'

let g:quickrun_config = {}
let g:quickrun_config['mkd'] = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser'
      \ }

