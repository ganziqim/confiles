" 插件管理
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'FooSoft/vim-argwrap'
Plug 'ganziqim/translator.vim'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular' " must come before vim-markdown
Plug 'honza/vim-snippets'
Plug 'hotoo/pangu.vim'
Plug 'iamcco/markdown-preview.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lfv89/vim-interestingwords'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-startify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/denite.nvim'
Plug 'SirVer/ultisnips'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vimmake'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-jp/vimdoc-ja'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'yianwillis/vimcdoc'

" Python Plugins
Plug 'zchee/deoplete-jedi'

" Golang Plugins
Plug 'fatih/vim-go'
"Plug 'zchee/deoplete-go', { 'do': 'make' }

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'

" always use deoplete

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()

" 特殊配置项

" 语法高亮
if has("syntax")
  syntax on
endif

" 开启类型插件支持 (pyflakes)
filetype on
filetype plugin on

if has("autocmd")
  filetype plugin indent on
endif

" GUI 启动时最大化

if has('gui_running') && has('win32')
  au GUIEnter * simalt ~x
endif

" 显示效果配置

" ColorScheme autocmd must before load colorscheme
augroup VimrcColors
  au!
  autocmd ColorScheme * highlight MyTODO  ctermfg=3 guifg=#b58900
  autocmd ColorScheme * highlight MyXXX   cterm=underline ctermfg=1 gui=underline guifg=#dc322f
  autocmd ColorScheme * highlight MyFIXME ctermfg=10 ctermbg=9 guifg=#073642 guibg=#cb4b16
augroup END

" 配色方案
syntax enable
"set background=dark

"let g:space_vim_dark_background = 235
"colorscheme space-vim-dark
"hi Comment cterm=italic
"hi Search cterm=reverse gui=reverse
"set termguicolors

colorscheme base16-solarized-dark
set termguicolors
" :h xterm-true-color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"colorscheme gruvbox
"let g:gruvbox_contrast_dark='soft'

"colorscheme solarized

"let g:seoul256_background = 235
"colorscheme seoul256

"hi Normal guibg=#000000
"hi Search cterm=reverse ctermfg=2 guifg=Black guibg=Blue


" 字体设置
set guifont=Source_Code_Pro:h11

" quick fix window

nnoremap cn :cnext<CR>
nnoremap cp :cprevious<CR>
nnoremap cx :cclose<CR>
nnoremap co :copen<CR>

" 禁止显示滚动条
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r

" 禁止显示工具条
set guioptions-=T

" SET

" mac 下使用系统剪切板
set clipboard=unnamed

" 禁止生成临时文件
set nobackup
set noswapfile

" 允许使用鼠标
set mouse=a

" 高亮列 hi colorcolumn
autocmd FileType python,c set colorcolumn=80

" 设置不兼容 vi
set nocp
" 允许隐藏被修改过的 buffer
set hidden
set showtabline=2
set noshowmode
" 显示状态栏
set laststatus=2

set showmatch

" 关于折叠
set foldenable
set foldmethod=marker

" Tab 切换成 4 个空格
set expandtab
set tabstop=4
set shiftwidth=4

autocmd FileType html,javascript,css,yaml,json set tabstop=2
autocmd FileType html,javascript,css,yaml,json set shiftwidth=2

set smarttab

" 以下格式的文件禁止 Tab 转换为空格
autocmd FileType make,go set noexpandtab

set autoindent
set smartindent

set autoread

" 编码设置

" Vim 内部缓冲、菜单、消息的字符编码
set encoding=utf-8
" Vim 终端的编码方式，对 gVim 无效，Console 模式控制代码页
set termencoding=utf-8
" 设置文件编码，按照 fileencodings 的顺序探测文件编码
if has('win32')
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 解决 Vim 提示信息乱码
language messages zh_cn.utf-8
" 解决 Vim 菜单乱码，重新载入 menu
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

" 显示行号
set number
" 显示光标当前位置
set ruler

set showcmd

" 高亮显示当前行 / 列
set cursorline
" set cursorcolumn 影响 icon 显示

" 选中的文本高亮
set hlsearch

" 设置空格和缩进的提示
set list
set listchars=tab:\|-,trail:·,extends:>,precedes:<
" 编辑 .go 时不显示 tab
autocmd FileType go set nolist

" 启动时不显示提示
set shortmess=atIW

" 实时搜索功能配置
set incsearch
set ignorecase

" Vim 自身命令行模式智能补全
set wildmenu

set completeopt=menuone,preview,longest

" 自定义 command

command! -bang -nargs=0 -range=0 GitPush call asyncrun#run('<bang>', '', '-raw git push', 3, <line1>, <line2>)

" 自定义 mapping

nnoremap <silent> bl :ls<CR>
nnoremap <silent> bo :enew<CR>
nnoremap <silent> bn :bnext<CR>
nnoremap <silent> bq :bprevious<CR>
nnoremap <silent> bp :bprevious<CR>
nnoremap <silent> bd :bdelete<CR>

nnoremap J 3<C-y>
nnoremap K 3<C-e>

nnoremap <silent> <C-s> :w<CR>

" leader mapping

" https://stackoverflow.com/questions/446269/can-i-use-space-as-mapleader-in-vim
" make sure you use double quotes
let mapleader="\<space>"

nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>:nohlsearch<CR>

nnoremap <silent> <leader>m :nohlsearch<CR>

nnoremap <leader>w :w<CR>

" Plugins

" Asyncrun

let g:asyncrun_open = 10

" ArgWrap

nnoremap <silent> <leader>a :ArgWrap<CR>
" 展开 Python 代码时最后一行添加逗号
autocmd FileType python let g:argwrap_tail_comma = 1

" denite

nnoremap <leader>pf :call denite#start([{'name': 'grep', 'args': ['', '', '!']}])<CR>
let s:insert_mode_mappings = [
            \  ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
            \  ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
            \  ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
            \  ['<C-c', '<denite:quit>', 'noremap'],
            \  ['<C-r>', '<denite:redraw>', 'noremap'],
            \ ]
let s:normal_mode_mappings = [
            \   ["'", '<denite:toggle_select_down>', 'noremap'],
            \   ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
            \   ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
            \   ['gg', '<denite:move_to_first_line>', 'noremap'],
            \   ['sv', '<denite:do_action:vsplit>', 'noremap'],
            \   ['sp', '<denite:do_action:split>', 'noremap'],
            \   ['q', '<denite:quit>', 'noremap'],
            \   ['r', '<denite:redraw>', 'noremap'],
            \ ]
for s:m in s:insert_mode_mappings
    call denite#custom#map('insert', s:m[0], s:m[1], s:m[2])
endfor
for s:m in s:normal_mode_mappings
    call denite#custom#map('normal', s:m[0], s:m[1], s:m[2])
endfor
unlet s:m s:insert_mode_mappings s:normal_mode_mappings

" indentLine

" json
let g:indentLine_fileTypeExclude = ['json']

" vim-go

let g:go_doc_keywordprg_enabled = 0

" vim-markdown

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_json_frontmatter = 0
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_conceal = 0

" vim-markdown-toc

let g:vmt_auto_update_on_save = 1
let g:vmt_list_item_char = '-'

" grepper

nnoremap <leader>g :Grepper -tool grep<CR>
nnoremap <leader>G :Grepper -tool grep -cword<CR>
command! TODO :Grepper
            \ -noprompt
            \ -tool git
            \ -grepprg git grep -nIi '\(TODO\|FIXME\)'
nmap go <plug>(GrepperOperator)
xmap go <plug>(GrepperOperator)

" easymotion

map  <leader>f <plug>(easymotion-bd-f)
nmap <leader>f <plug>(easymotion-overwin-f)

map  <leader>F <plug>(easymotion-bd-f2)
nmap <leader>F <plug>(easymotion-overwin-f2)
let g:EasyMotion_enter_jump_first = 1

" Move to line
map <leader>l <plug>(easymotion-bd-jk)
nmap <leader>l <plug>(easymotion-overwin-line)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" indentLine

let g:indentLine_char = '│'

" easyclip

nnoremap <leader>p :IPaste<CR>
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAutoFormat = 1
nnoremap <silent> <leader>yf :call EasyClip#Yank(expand('%'))<cr>:echo 'Filename copied'<CR>

" ultisnips

let g:UltiSnipsExpandTrigger="<c-o>"

" tagbar

map gb :TagbarToggle<CR>
let g:tagbar_width = 50
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumers = 1

" gitgutter

nnoremap <leader>hn :GitGutterNextHunk<CR>
nnoremap <leader>hp :GitGutterPrevHunk<CR>
nnoremap <leader>ha :GitGutterStageHunk<CR>
nnoremap <leader>hr :GitGutterUndoHunk<CR>

" airline

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
" 显示 buffer 编号，方便切换
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_powerline_fonts=1
"let g:airline_theme='violet'
"let g:airline_theme='deus'
"let g:airline_theme='angr'
let g:airline_theme='solarized'

" tmuxline

let g:tmuxline_preset = {
      \'a'    : '#I #W',
      \'b'    : '#(curl -s zh.wttr.in/ShangHai:JieYang\?format\="%%l%%20%%c%%20%%t%%20%%h&period=60")',
      \'c'    : '',
      \'x'    : '',
      \'y'    : '%F %R',
      \'z'    : '%A'}

" Startify

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif
" disable indentline in startify
autocmd User Startified IndentLinesToggle
let g:startify_bookmarks = ['~/.vimrc']
let g:startify_update_oldfiles = 1
" autoload Session.vim
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1

" vim-devicons

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" NERDTree 配置

" 装饰窗体
let NERDChristmasTree=1
" 高亮选中行
let NERDTreeHighlightCursorline=1
" 打开文件后自动关闭树
let NERDTreeQuitOnOpen=1
" 显示的窗体位置
let NERDTreeWinPos='left'
" 显示隐藏文件
let NERDTreeShowHidden=1
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', 'node_modules']
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
" 禁用 J 和 K 两个 Map
let NERDTreeMapJumpFirstChild=''
let NERDTreeMapJumpLastChild=''
" 设置映射键位
nnoremap <silent> gt :NERDTreeToggle<CR>
" 不指定文件启动时自动开启文件树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 只剩下 NERDTree 窗口的时候自动关闭 Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter 配置
" 在注释后加空格
let g:NERDSpaceDelims=1
" 可以注释空行
let g:NERDCommenterEmptyLines=1

" wildfire.vim

map <leader>w <plug>(wildfire-fuel)

" ctrlp 配置

let g:ctrlp_map = 'tg'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|class|png|jpg|jpeg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" 使用最近的 .git 作为工作目录
let g:ctrlp_working_path_mode = 'r'

" supertab

let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

" pangu.vim 配置

" 有性能问题，暂时不开启
" autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" 自定义 autocmd

" 通过各种手段打开文件的时候隐藏高亮
autocmd BufEnter :nohlsearch<CR>

augroup python_map
    autocmd!
    autocmd FileType python nnoremap gd :call append(line("."),'__import__("pdb").set_trace()')<CR>
    autocmd FileType python nnoremap gp :call append(line("."),'__import__("pprint").pprint(None)')<CR>
augroup END

if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('MyTODO',  '\c\V\zsTODO\ze')
        autocmd Syntax * call matchadd('MyXXX', '\V\zsXXX\|HACK\ze')
        autocmd Syntax * call matchadd('MyFIXME', '\V\zsFIXME\|BUG\ze')
    endif
endif
