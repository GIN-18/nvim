" fzf
" -------------------------------------------------------------------
" 搜索文件
noremap <silent> <M-f> :Files<CR>
" 搜索标记
noremap <silent> <M-m> :Marks<CR>
" 搜索历史文件
noremap <silent> <M-h> :History<CR>
" 搜索Buffers
noremap <silent> <M-b> :Buffers<CR>
" 搜索单词
" noremap <silent> <M-R> :Rg<CR>
" 搜索历史命令
" noremap <silent> <M-c> :History:<CR>

" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" - down / up / left / right
let g:fzf_layout = { 'down': '50%' }

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

""function! s:list_buffers()
""  redir => list
""  silent ls
""  redir END
""  return split(list, "\n")
""endfunction
""
""function! s:delete_buffers(lines)
""  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
""endfunction
""
""" Override statusline as you like
""function! s:fzf_statusline()
""  highlight fzf1 gui=bold guifg=#d7005f guibg=#c6c6c6
""  highlight fzf2 gui=bold guifg=#005f5f guibg=#c6c6c6
""  setlocal statusline=%#fzf1#\ >\ %#fzf2#fzf
""endfunction
""
""autocmd! User FzfStatusLine call <SID>fzf_statusline()
