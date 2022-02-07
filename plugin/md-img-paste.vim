" md-img-paste
" -------------------------------------------------------------------
" let g:mdip_imgname = 'image'
let g:mdip_imgdir = 'images'
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
