" coc.nvim
" -------------------------------------------------------------------
" 自动加载coc插件
let g:coc_global_extensions = [
		\ 'coc-git',
		\ 'coc-html',
    \ 'coc-sh',
		\ 'coc-css',
		\ 'coc-tsserver',
		\ 'coc-vetur',
		\ 'coc-json',
		\ 'coc-emmet',
		\ 'coc-eslint',
		\ 'coc-snippets',
		\ 'coc-highlight',
		\ 'coc-prettier']

set updatetime=160
set shortmess+=c

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
" GoTo code navigation.
" 跳转到函数所在的位置
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> <LEADER>gd <Plug>(coc-definition)

" 跳转到代码有误的地方
nmap <silent> <LEADER>gr <Plug>(coc-diagnostic-prev)

" Use <LEADER>k to show documentation in preview window.
nnoremap <silent> <LEADER>k :call <SID>show_documentation()<CR>
