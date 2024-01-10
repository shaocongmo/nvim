call plug#begin('~/.config/nvim/plugged')
" 目录插件
"Plug 'scrooloose/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.1'}

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

Plug 'ggandor/leap.nvim'

Plug 'natecraddock/workspaces.nvim'

Plug 'akinsho/toggleterm.nvim'

Plug 'github/copilot.vim'

Plug 'kazhala/close-buffers.nvim'

Plug 'numToStr/Comment.nvim'

call plug#end()

" 显示行号
set number
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab

"搜索忽略大小写
set ignorecase
set smartcase

"编码设置
set enc=utf-8
set fencs=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

"禁止生成临时文件
"set nobackup
"set noswapfile

" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 十字光标
set cursorline
set cursorcolumn

" 禁用鼠标
set mouse=

set clipboard+=unnamedplus

" <leader> 改为 ,
let mapleader = ','

" molokai
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme onedark
"colorscheme molokai

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1
" let g:go_bin_path = '$GOBIN'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" bufferline
set termguicolors

" leap  s 往后匹配  S 往前匹配  空格切换到下一匹配
lua require('leap').add_default_mappings()

lua require("workspaces").setup()

lua require("telescope").load_extension("workspaces")

lua require("toggleterm").setup({direction = 'float'})

lua require("bufferline").setup()

lua require("telescope").setup({defaults = {file_ignore_patterns = {'%.beam', 'ebin/.*', '_checkouts/.*'} } })

lua require("nvim-tree").setup()

" keymap
nnoremap <leader>t :NvimTreeToggle<cr>

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>F <cmd>Telescope live_grep<cr>

nnoremap <c-p> <cmd>bprev<cr>
nnoremap <c-n> <cmd>bnext<cr>
nnoremap <leader>d <cmd>bd<cr>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gr <Plug>(coc-references)

" 分屏 
nmap <leader>s <cmd>split<cr>
nmap <leader>h <cmd>vsplit<cr>

" 切换窗口
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k

nmap <leader>p <cmd>Telescope workspaces<cr>

nnoremap <leader>T <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <BackSpace> <cmd>nohl<cr>

nnoremap <leader>U vwU
nnoremap <leader>u vwu
noremap <leader>b <cmd>:!echo 'hello'<cr>
vmap <leader>c gc
nmap <leader>e <cmd>:e ~/.config/nvim/init.vim<cr>

