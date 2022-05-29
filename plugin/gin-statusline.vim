" statusline
" -------------------------------------------------------------------
" 设置状态栏在倒数第二行
set laststatus=2
" 设置状态栏 
set statusline=%<%1*[B-%n]%*
set statusline+=%2*[TOT:%{Buf_total_num()}]%*
set statusline+=%3*\ %{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}\ %*
set statusline+=%4*\ %F\ %*
set statusline+=%5*\ %{File_size(@%)}\ %*
set statusline+=%6*\ 
set statusline+=%=%7*\ %m%r%y\ %*
set statusline+=%8*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-14.(row:%l/%L,col:%c%V%)\ %*
set statusline+=%9*\ %P\ %*

hi User1 gui=bold guifg=#3b4252 guibg=#88c0d0
hi User2 gui=bold guifg=#3b4252 guibg=#8fbcbb
hi User3 gui=bold guifg=#a3be8c guibg=#3b4252
hi User4 gui=bold guifg=#b0c4de guibg=#434c5e
hi User5 gui=bold guifg=#c6c6c6 guibg=#4c566a
hi User6 gui=bold guifg=#afd7ff guibg=#3b4252
hi User7 gui=bold guifg=#add8e6 guibg=#4c566a
hi User8 gui=bold guifg=#bcbcbc guibg=#434c5e
hi User9 gui=bold guifg=#e6e6fa guibg=#4c566a

function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! File_size(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
    endif
endfunction

" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction
