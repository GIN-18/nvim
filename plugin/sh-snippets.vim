nnoremap <silent> <LEADER>sh :call SetTitle()<CR>

function SetTitle()
  if expand("%:e") == 'sh'
    call setline(1, "#!/bin/bash")
    call setline(2, "")
    call setline(3, "# Author: gin")
    call setline(4, "# Description: <++>")
    call setline(5, "")
    call setline(6, "<++>")
  endif
endfunction
