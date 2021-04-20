" dict
" -------------------------------------------------------------------
" 翻译光标下的单词并在dict窗口显示
nmap <silent> <LEADER>t <Plug>DictWSearch
vmap <silent> <LEADER>t <Plug>DictWVSearch
" 翻译光标下的单词并替换翻译结果
nmap <silent> <LEADER>r <Plug>DictRSearch
vmap <silent> <LEADER>r <Plug>DictRVSearch
" 输入需要翻译的单词
noremap <M-w> :DictW 
