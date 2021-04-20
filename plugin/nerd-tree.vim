" nerdtree
" -------------------------------------------------------------------
noremap <M-e> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeStatusline = -1
let NERDTreeMinimalUI = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
