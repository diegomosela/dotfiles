" Diego Mosela
" .vimrc
" Based on the .vimrc from Aurelio Marinho Jargas
" (http://www.aurelio.net/doc/coluna/coluna-09.vim)

" ------------------------------------------------------- "

" Set the colors
set background=dark
if has("terminfo")
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
else
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif
syn on

" Default color settings
" colo default
colo koehler

" Abbreviations
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q
cab Wqa wqa

" Default settings
set bs=2                    " Backspace mode
set ts=4                    " Tab stop
set sw=4                    " Shift width
set sts=4                   " Soft tab stop
set et                      " Expand tab
set nu                      " Show line numbers
set ai                      " Auto indent
set sm                      " Show match
set is hls ic scs           " Search options
set wildmode=longest,list   " <TAB> completion
"set foldmethod=indent       " Set the folding method
set mouse=a                 " Set the mouse for all modes
set ruler                   " Show the cursor position 

" Functions

" Hide the comments
fu! CommOnOff()
    if !exists('g:hiddcomm')
        let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
    else
        unlet g:hiddcomm | hi Comment ctermfg=cyan guifg=blue
    endif
endfu
map <F2> :call CommOnOff()<CR>

" OmniComplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Toggle GUI Toolbar off
set guioptions-=T

" Map tabs shortcuts
map tn :tabnext<CR>
map tp :tabprev<CR>
map te :tabedit<CR>

" Map vertical split command
map vn :vertical new

" Trim spaces
autocmd FileType c,php,python,html,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e