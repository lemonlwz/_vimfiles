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
"" �����������ļ�
set nobackup
set ignorecase
set smartcase
set hlsearch
"" set incsearch
"" backspace ɾ����
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

"" ������ʾ״̬��
set laststatus=2
"" ״̬������
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

set diffopt=vertical

set splitright

syntax on

"" enable file type detection
filetype on
filetype plugin on
filetype indent on

" ����VIMƤ��ɫ
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

"" ����
map <silent> 'y "+y

"" ����ѡ��
vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"" ------------{--------------
"" �Զ����� session
set sessionoptions=buffers,curdir,resize,folds,tabpages  
"" ע��Ŀ¼Ҫ����  
autocmd VimLeave * mks! $HOME/vim-session.vim  

"" ���� vim ʱ�Զ���ȡ session �ļ�, Ŀǰ���¶��� vim.bat/gvim.bat
"" autocmd VimEnter * :call s:ReadSession()
"" function s:ReadSession()
"" 	let session_file = $HOME . "/vim-session.vim"
"" 	if filereadable( session_file )
"" 		execute "so " . session_file
"" 	endif
"" endfunction
"" ------------}--------------

"" �򿪵�ǰ�ļ���Ŀ¼
map <silent> ,o :Explore<CR><CR>
"" map <silent> ,v :Vexplore<CR><CR>
map <silent> ,q :close<CR><CR>

"" �л�����ǰ�ļ���Ŀ¼
map <silent> <leader>cd :cd %:h<cr>
"" �� cmd
if (has('win32'))
map <silent> <Leader>st :!start<CR>
endif

"" ���ڴ�С
map <silent> ,> :vert res<CR>
map <silent> ,< :res<CR>
map <silent> ,, <C-W>=

" �����ƶ�
map <c-n> 5j
map <c-p> 5k

"" ���뵱ǰ����
"nnoremap <F5> "=strftime("%c")<CR>P
"inoremap <F5> <C-R>=strftime("%c")<CR>

" HTML5 ģ���滻, 
iab html5 <!doctype html><CR><html><CR><head><CR><meta charset="gbk" /><CR><title></title><CR><link rel="stylesheet" href="css_example_url" /><CR><script src="js_example_url"></script><CR></head><CR><body><CR><div><CR></div><CR><script><CR>/*hello world*/<CR></script><CR></body><CR></html><Esc>6k

"" Delete files in vim
"" usage: 
""   :Remove filename
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')


"" plugin ��� {{

"" NERD Tree
cd d:/
map <silent> ,v :NERDTreeToggle<CR>

"" bufexplorer
let g:bufExplorerSplitRight=0

"" taglist
"" ֻ��ʾ��ǰ�ļ�
let Tlist_Show_One_File = 1
nnoremap <silent> <F6> :TlistToggle<CR>

"" Scratch
"" windows ������ʱ����, �����±���
let g:scratch_buffer_name='[Scratch]'
map <silent> <Leader>so :ScratchOpen<CR>


" ������ʾ״̬��
set laststatus=2

set guifontset=
set guifont=monaco:h10
"set gfw='΢���ź�':h12
"set guifontwide=Microsoft\ Yahei:h12
set guifontwide=Consolas:h12

let g:user_zen_expandabbr_key = '<m-e>'    "����Ϊctrl+eչ��
let g:use_zen_complete_tag = 1

set novisualbell

set scrolloff=8


" ��ʾ�����ַ�(���� tab �� �ո�)
set list
" Highlight problematic whitespace
set listchars=tab:,.,trail:.,extends:#,nbsp:.
set cpoptions+=$

"�����ƶ�
nnoremap <silent> ,h <C-w>h
nnoremap <silent> ,j <C-w>j
nnoremap <silent> ,k <C-w>k
nnoremap <silent> ,l <C-w>l

"�������¶��ٸ�����
set scrolloff=3

"�Զ�͸��
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)

map <M-8> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 180) <CR>
map <M-9> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230) <CR>
map <M-0> <ESC>:call libcallnr("vimtweak.dll", "SetAlpha", 255) <CR>

"�Զ����õ�ǰ�༭�ļ�Ϊ��ǰĿ¼
set autochdir

