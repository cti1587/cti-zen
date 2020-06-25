call plug#begin('~/.vim/plugged')
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'yggdroot/indentline'
    Plug 'ncm2/ncm2'
    Plug 'easymotion/vim-easymotion'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'https://github.com/vim-scripts/fcitx.vim.git'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/vim-easy-align'
    Plug 'mattn/emmet-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'roxma/nvim-yarp'
    Plug 'altercation/vim-colors-solarized'
    Plug 'davidhalter/jedi-vim'
"    Plug 'klen/python-mode'
call plug#end()

let mapleader=','

inoremap jj <Esc>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

nmap ss <Plug>(easymotion-s2)

syntax enable
set background=dark
colorscheme solarized
" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
" 高亮当前行
set cursorline
" 显示行号
set number
" 显示竖线
set cursorcolumn

" 关闭NERDTree快捷键
map <leader>ne :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
" let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 显示书签列表
let NERDTreeShowBookmarks=1

"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
 let g:NERDTreeDirArrowExpandable = '▸'
 let g:NERDTreeDirArrowCollapsible = '▾'
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" 过滤: 所有指定文件和文件夹不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']


" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" let g:pymode_python = 'python3'
" let g:pymode_trim_whitespaces = 1
" let g:pymode_doc=1
" let g:pymode_doc_bind = 'K'
" let g:pymode_rope_goto_definition_bind = "<C-[>"
" let g:pymode_lint = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
" let g:pymode_options_max_line_length = 120
