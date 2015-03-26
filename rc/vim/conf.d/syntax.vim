syntax on
set number

set list
set listchars=tab:>\ ,trail:~,nbsp:%,extends:>,precedes:<

highlight SpecialKey term=underline ctermfg=darkcyan guifg=darkcyan
highlight IdeographicSpace term=underline ctermbg=LightCyan guibg=LightCyan
autocmd VimEnter,WinEnter * match IdeographicSpace /　/
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/
