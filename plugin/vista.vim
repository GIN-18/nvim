" vista
" -------------------------------------------------------------------
nnoremap <silent> <M-v> :Vista!!<CR>
nnoremap <silent> <M-V> :Vista finder<CR>

let g:vista_sidebar_width = 40
let g:vista_keep_fzf_colors = 1
let g:vista_cursor_delay = 000
let g:vista_disable_statusline = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_highlight_whole_line = 1
let g:vista_default_executive = 'coc'
let g:vista_stay_on_open = 1
let g:vista_close_on_jump = 1

autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif
