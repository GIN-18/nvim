" markdown-preview.nvim
" -------------------------------------------------------------------
" nnoremap <silent> <M-m> :MarkdownPreview<CR>

" 自动启动(默认为0，改为1为开启自动启动)
let g:mkdp_auto_start = 0
" 自动刷新(默认为0,改为1为开启自动刷新)
let g:mkdp_refresh_slow = 1
" 设置的预览浏览器
let g:mkdp_browser = 'microsoft-edge-beta'
" 设置预览的样式
let g:mkdp_markdown_css = expand('~/.config/nvim/static/markdown.css')
" 设置高亮的样式
let g:mkdp_highlight_css = expand('~/.config/nvim/static/highlight.css')
" 设置主题
let g:mkdp_theme = 'dark'
