" -------------------------------------------------------------------
"
" Auto load for first time uses
"
" -------------------------------------------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" -------------------------------------------------------------------
"
" vim-init
"
" -------------------------------------------------------------------
" 打开高亮
syntax on
" 不兼容vi
set nocompatible
" 识别文件类型filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 设置tab键的缩进格数
set tabstop=2
set shiftwidth=2
set softtabstop=2
" 设置光标距离顶部和底部的固定位置
set scrolloff=5
" 设置编码格式为utf-8
set encoding=utf-8
" 当窗口不能完整显示一行内容时，会换行显示
set wrap
" 显示行号
set number
" 以相对位置的方式显示行号
set relativenumber
" 在命令模式下输入字符时，按下tab键会提示可选项，类似linux终端的自动补全
set wildmenu
" 高亮搜索结果
set hlsearch
" 在搜索状态下输入字符时，显示高亮（边输入边高亮）
set incsearch
" 忽略大小写
set ignorecase
" 智能大小写
set smartcase
" 自动切换当前工作路径
set autochdir
" 将折叠方式设置为manual
set foldmethod=manual
" 光标所在的行高亮
set cursorline
" 窗口在下方打开
set splitbelow
" 启用gui配色
set termguicolors
" 空格替换制表
set expandtab
" 设置颜色主题
colorscheme gin-colorscheme
" 解决不同终端下vim的配色问题
let &t_ut=''
" 设置leader键为空格键
let mapleader=" "
" 设置不同模式下显示不同的光标样式
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
exec "nohlsearch"
" 设置重新进入文件时，光标留在上次退出的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 退出插入模式时自动切换到英文
let s:fcitx_cmd = executable("fcitx5-remote") ? "fcitx5-remote" : "fcitx-remote"
autocmd InsertLeave * let b:fcitx = system(s:fcitx_cmd) | call system(s:fcitx_cmd.' -c')
autocmd InsertEnter * if exists('b:fcitx') && b:fcitx == 2 | call system(s:fcitx_cmd.' -o') | endif

" -------------------------------------------------------------------
"
" keyMapping
"
" -------------------------------------------------------------------
" noremap
" -------------------------------------------------------------------
noremap <silent> Q :q<CR>
noremap <silent> s :w<CR>
noremap <silent> S :wq<CR>
noremap K 5k
noremap J 5j
noremap H 0
noremap L $
noremap n nzz
noremap N Nzz
noremap <M-H> <C-w>h
noremap <M-J> <C-w>j
noremap <M-K> <C-w>k
noremap <M-L> <C-w>l
noremap <M-p> "+p
noremap <M-t> :new<CR>:term<CR>i
noremap <M-g> :new<CR>:term lazygit<CR>i
noremap <LEADER>nh :nohlsearch<CR>
noremap <LEADER>co :!chromium %&<CR><CR>
noremap <LEADER>ch o<!--  --><Esc>F-;hi
noremap <LEADER>cc o/*  */<Esc>F*hi
noremap <LEADER>cj o/*<CR>*/<Esc>O<Tab>
" 打开一个新的标签页
noremap <LEADER>nt :tabe<CR>
" 切换到下一个标签页
noremap <Tab>l gt
" 切换到上一个标签页
noremap <Tab>h gT
" 打开拼写检查
noremap <LEADER>sc :set spell!<CR>
" 上下分屏，并且光标在下屏幕
noremap <LEADER><DOWN> :set splitbelow<CR>:split<CR>
" 左右分屏，并且光标在左屏幕
noremap <LEADER><LEFT> :set nosplitright<CR>:vsplit<CR>
" 改变分屏的大小
noremap <S-UP> :res +5<CR>
noremap <S-DOWN> :res -5<CR>
noremap <S-LEFT> :vertical resize+5<CR>
noremap <S-RIGHT> :vertical resize-5<CR>
" 按两下空格键''并且进入插入模式
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" inoremap
" -------------------------------------------------------------------
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap { {}<Esc>i
inoremap <C-]> <++>

" vnoremap
" -------------------------------------------------------------------
vnoremap Y "+y

" tnoremap
" -------------------------------------------------------------------
" tnoremap <M-q> <C-d>

" -------------------------------------------------------------------
"
" autocmd
"
" -------------------------------------------------------------------
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd FileType md source ~/.config/nvim/plugin/markdown-snippets.vim

" -------------------------------------------------------------------
"
" plugins
"
" -------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" markdown预览插件
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['markdown', 'vim-plug'] }

" markdown表格模板插件
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['markdown', 'vim-plug'] }

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" rnvimr
Plug 'kevinhwang91/rnvimr', { 'on': 'RnvimrToggle' }

" vim-startify
Plug 'mhinz/vim-startify'

" translate
Plug 'iamcco/dict.vim', { 'on': ['DictW', '<Plug>DictWSearch', '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch']}
                                                                                      
" nerdtree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" vim-devicons
Plug 'ryanoasis/vim-devicons'

" vista
Plug 'liuchengxu/vista.vim', { 'on': 'Vista!!' }

" bracey.vim
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server', 'on': 'Bracey' }

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" md-img-paste
Plug 'ferrine/md-img-paste.vim', { 'for': ['markdown', 'vim-plug'] }

" calendar.vim
" Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }

" leaderf
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" vim-terminal-help
" Plug 'skywind3000/vim-terminal-help'

" dashboard-nvim
" Plug 'glepnir/dashboard-nvim'

" vim-snippets代码片段库
" Plug 'honza/vim-snippets'

call plug#end()

" -------------------------------------------------------------------
"
" pluginSetting
"
" -------------------------------------------------------------------
" bracey
" -------------------------------------------------------------------
nnoremap <silent> <M-i> :Bracey<CR><CR>

let g:bracey_refresh_on_save = 1

" rnvimr
" -------------------------------------------------------------------
nnoremap <silent> <M-r> :RnvimrToggle<CR>

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" md-img-paste
" -------------------------------------------------------------------
" let g:mdip_imgname = 'image'
let g:mdip_imgdir = 'images'
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>


" 找到当前光标下的字符属于那个highlight-group
" -------------------------------------------------------------------
noremap <LEADER>si :call <SID>SynStack()<CR>

function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
