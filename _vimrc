set nocompatible

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set nocompatible
"" 不产生备份文件
set nobackup
set ignorecase
set smartcase
set hlsearch
"" set incsearch
"" backspace 删除键
set backspace=indent,eol,start
set expandtab

set foldcolumn=1
set number

set display=lastline

"" default fileencoding
set fenc=gbk
set fencs=utf-8,ucs-bom,euc-jp,gb18030,gbk,gb2312,cp936

"" see help (complex)
set fo=tcrqn

"" tab spacing (settings below are just to unify it)
set tabstop=2
"" unify
set softtabstop=2
"" unify
set shiftwidth=2

"set textwidth=78

"" 总是显示状态栏
set laststatus=2
"" 状态栏设置
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

set diffopt=vertical

set splitright

syntax on

"" enable file type detection
filetype on
filetype plugin on
filetype indent on

" 设置VIM皮肤色
set bg=dark
set t_Co=256

let g:solarized_termcolors=256
colorscheme solarized

if has("gui_running")
   " set default size: 90x35
   set columns=90
   set lines=35
   " No menus and no toolbar
   set guioptions-=m
   set guioptions-=T
endif

set modeline
set tabstop=2 " tab size = 2
set shiftwidth=2 " soft space = 2
set smarttab
"set expandtab " expand tabs
set wildchar=9 " tab as completion character

set virtualedit=block
set clipboard+=unnamed  " Yanks go on clipboard instead.
set showmatch " Show matching braces.

" Line wrapping on by default
set wrap
set linebreak

set history=50 " keep track of last commands
set number ruler " show line numbers
set incsearch " incremental searching on
set hlsearch " highlight all matches
set smartcase
set cursorline
set selectmode=key
set showtabline=2 " show always for console version
set laststatus=2 " Always show the statusline
set tabline=%!MyTabLine()
set wildmenu " menu on statusbar for command autocomplete
"set list

"" 复制
map <silent> 'y "+y

"" 搜索选中
vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"" ------------{--------------
"" 自动保存 session
set sessionoptions=buffers,curdir,resize,folds,tabpages  
"" 注意目录要存在  
autocmd VimLeave * mks! $HOME/vim-session.vim  

"" 启动 vim 时自动读取 session 文件, 目前重新定义 vim.bat/gvim.bat
"" autocmd VimEnter * :call s:ReadSession()
"" function s:ReadSession()
"" 	let session_file = $HOME . "/vim-session.vim"
"" 	if filereadable( session_file )
"" 		execute "so " . session_file
"" 	endif
"" endfunction
"" ------------}--------------

"" 打开当前文件的目录
map <silent> ,o :Explore<CR><CR>
"" map <silent> ,v :Vexplore<CR><CR>
map <silent> ,q :close<CR><CR>

"" 切换到当前文件的目录
map <silent> <leader>cd :cd %:h<cr>
"" 打开 cmd
if (has('win32'))
map <silent> <Leader>st :!start<CR>
endif

"" 窗口大小
map <silent> ,> :vert res<CR>
map <silent> ,< :res<CR>
map <silent> ,, <C-W>=

" 快速移动
map <c-n> 5j
map <c-p> 5k

"" 插入当前日期
"nnoremap <F5> "=strftime("%c")<CR>P
"inoremap <F5> <C-R>=strftime("%c")<CR>

" HTML5 模板替换, 
iab html5 <!doctype html><CR><html><CR><head><CR><meta charset="gbk" /><CR><title></title><CR><link rel="stylesheet" href="css_example_url" /><CR><script src="js_example_url"></script><CR></head><CR><body><CR><div><CR></div><CR><script><CR>/*hello world*/<CR></script><CR></body><CR></html><Esc>6k

"" Delete files in vim
"" usage: 
""   :Remove filename
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')


"" plugin 相关 {{

"" NERD Tree
cd d:/
map <silent> ,v :NERDTreeToggle<CR>

"" bufexplorer
let g:bufExplorerSplitRight=0

"" taglist
"" 只显示当前文件
let Tlist_Show_One_File = 1
nnoremap <silent> <F6> :TlistToggle<CR>

"" Scratch
"" windows 下启动时出错, 设置下避免
let g:scratch_buffer_name='[Scratch]'
map <silent> <Leader>so :ScratchOpen<CR>


" 总是显示状态行
set laststatus=2

set guifontset=
set guifont=monaco:h10
"set gfw='微软雅黑':h12
"set guifontwide=Microsoft\ Yahei:h12
set guifontwide=Consolas:h12

let g:user_zen_expandabbr_key = '<m-e>'    "设置为ctrl+e展开
let g:use_zen_complete_tag = 1

set novisualbell

set scrolloff=8


" 显示特殊字符(区分 tab 和 空格)
set list
" Highlight problematic whitespace
set listchars=tab:,.,trail:.,extends:#,nbsp:.
set cpoptions+=$

"窗口移动
nnoremap <silent> ,h <C-w>h
nnoremap <silent> ,j <C-w>j
nnoremap <silent> ,k <C-w>k
nnoremap <silent> ,l <C-w>l

"距离上下多少个空行
set scrolloff=3

"自动透明
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)

map <M-8> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 180) <CR>
map <M-9> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230) <CR>
map <M-0> <ESC>:call libcallnr("vimtweak.dll", "SetAlpha", 255) <CR>

"自动设置当前编辑文件为当前目录
set autochdir

