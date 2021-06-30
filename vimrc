set nu " 设置行号
inoremap jk <esc> " 映射 jk 为 esc 键盘 
set encoding=utf-8 " 设置编码
set nocompatible " 兼容
set t_Co=256 " 256色
set incsearch " 开启实时搜索
set ignorecase " 搜索时大小写不敏感
filetype plugin indent on
syntax on " 高亮
set backspace=indent,eol,start
if has('mouse')
  set mouse-=a
endif

" basic
syntax enable
set visualbell
set noerrorbells
set completeopt=longest,menu
set maxmempattern=262144
set cscopequickfix=s-,c-,d-,i-,t-,e-
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ts=4
set expandtab
set cindent
set novisualbell
set laststatus=2
set cinoptions=g0
set hlsearch
set incsearch
set pastetoggle=<F9>
" 设置光标所在的行列高亮
set cursorline
set cursorcolumn

" 插件安装
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 目录树
Plug 'preservim/nerdtree'
" 自动补全
Plug 'Valloric/YouCompleteMe'
" 配色方案
Plug 'morhetz/gruvbox' 
" 搜索
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs' 
" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline' 
" Markdown 需要额外安装 grip: brew install grip
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()

" 主题设置
colorscheme gruvbox
set background=dark

" 快捷键设置
map <C-n> :NERDTreeToggle<CR>

" golang 配置
let g:go_fmt_command = "goimports" "替换gofmt
let g:go_highlight_types = 1
let g:go_highlight_fields = 1 " 字段高亮
let g:go_highlight_functions = 1 " 函数高亮
let g:go_highlight_function_calls = 1 "函数调用高亮
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
au FileType go nmap <leader>r <Plug>(go-run)

"==============================================================================
"  LeaderF 插件
"==============================================================================
" let g:Lf_WindowPosition = 'popup' " 通过弹出框的形式搜索文件
let g:Lf_ShortcutF = '<C-P>' " 定义快捷键 ctrl+p 开启文件搜索
map <F5> :Leaderf rg<CR>
map <F4> :Leaderf rg --current-buffer<CR>
" 三石配置的一个搜索快捷键，并且屏蔽了vendor目录
set wildignore+=**/vendor/**
" nnoremap <space> za
" nnoremap <silent> <leader>f :vimgrep/<C-R><C-W>/**/*.go <CR> :cw <CR>
" 模仿三石的写法，自定义的搜索快捷键
" 输入 \fw，在当前文件搜索光标下的单词
nnoremap <silent> <leader>wf :Leaderf rg --current-buffer -F <C-R><C-W><CR>
" 输入 \gfw，在当前目录下搜索光标下的单词
nnoremap <silent> <leader>gwf :Leaderf rg -F <C-R><C-W><CR>
" 输入 \f，在当前文件搜索，需要输入搜索内容
nnoremap <silent> <leader>f :Leaderf rg --current-buffer <CR>
" 输入 \gf，在当前目录搜索，需要输入内容
nnoremap <silent> <leader>gf :Leaderf rg <CR>

"==============================================================================
" 自定义的一些快捷键
"==============================================================================
" 切换到上一个tab
map <s-k> :tabprevious<CR>
" 切换到下一个tab
map <s-j> :tabnext<CR>
" 新建一个tab
map <s-n> :tabnew<CR>
" 复制到系统剪切板
map <s-y> "*y <CR
" 从系统剪贴板粘贴
map <s-p> "*p <CR>
" 切换到左侧window
nnoremap <S-H> <C-W>h
" 切换到右侧window
nnoremap <S-L> <C-W>l


"==============================================================================
" Markdown 相关
"==============================================================================
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Microsoft Edge'
let vim_markdown_preview_hotkey='<C-m>'
