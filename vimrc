" 插件管理
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'hotoo/pangu.vim'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
  Plug 'Shougo/neocomplete'
  let g:neocomplete#enable_at_startup = 1
endif

call plug#end()

"一些特殊配置项(非set)

"语法高亮
if has("syntax")
  syntax on
endif


"开启类型插件支持(pyflakes)
filetype on
filetype plugin on

if has("autocmd")
  filetype plugin indent on
endif



"配色方案
syntax enable
set background=dark
colorscheme solarized
hi Normal guibg=#000000

"大多数SET

" mac下使用系统剪切板
set clipboard=unnamed

"禁止生成临时文件
set nobackup
set noswapfile

" 高亮列 hi colorcolumn
autocmd FileType python,c set colorcolumn=80

set nocp        "设置为扩展模式
set hidden
set showtabline=2
set noshowmode
set laststatus=2 "显示状态栏

"关于折叠
set foldenable
set foldmethod=marker


" Tab切换成4个空格
set tabstop=4
autocmd FileType  html,javascript,css,yaml set tabstop=2

"Tab转换为空格 公司fix
" set expandtab
autocmd FileType  make set noexpandtab

set autoindent


" 选中的文本高亮
set hlsearch

" encoding
set encoding=utf-8
set termencoding=utf-8
if has('win32')
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" language messages zh_cn.utf-8


"显示行号
set number
"显示光标当前位置
set ruler

"高亮显示当前行/列
set cursorline
set cursorcolumn


"设置空格核缩进的提示
set list
set listchars=tab:\|-,trail:=,extends:>,precedes:<


"启动时不显示提示
set shortmess=atIW

"实时搜索功能配置
set incsearch
set ignorecase

"vim 自身命令行模式智能补全
set wildmenu

" 自定义 mapping

" 上下移动行
nnoremap _ ddkkp
nnoremap - ddp

vnoremap _ U
vnoremap - u

nnoremap to :tabnew<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>

" 插件配置

map gb :TagbarToggle<CR>
let g:tagbar_width = 30

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"配置NERDTREE
let NERDChristmasTree=1 "装饰窗体!
let NERDTreeHighlightCursorline=1 "高亮选中行
let NERDTreeQuitOnOpen=1 "打开文件后自动关闭树
let NERDTreeWinPos='left'  "显示的窗体位置
nnoremap gt :NERDTreeToggle<cr>  "设置映射键位
autocmd VimEnter * NERDTree
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', 'node_modules']
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" ctrlp配置
let g:ctrlp_map = 'tg'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" pangu.vim 配置

autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" 自定义 iabbrev

iabbrev @@ ganziqim@live.com

" 自定义 autocmd

autocmd FileType python nnoremap gd :call append(line("."),'__import__("pdb").set_trace()')<CR>
autocmd FileType python nnoremap gp :call append(line("."),'__import__("pprint").pprint(None)')<CR>
