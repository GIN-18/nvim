" 找到当前光标下的字符属于那个highlight-group
" -------------------------------------------------------------------
noremap <LEADER>si :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
