" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set autoindent

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

" Change colorscheme from default to delek
colorscheme desert

set shiftwidth=4
set tabstop=4
"set tags=./tags;/
set tags=tags;
set autochdir
"允许光标在任何位置时用 CTRL-TAB 遍历 buffer
let g:miniBufExplMapCTabSwitchBufs=1

nnoremap <silent> <F7> :TlistToggle<CR>
"设置 tablist 插件只显示当前编辑文件的 tag 内容,而非当前所有打开文件的 tag 内容
let g:Tlist_Show_One_File = 1
"设置标签子窗口的宽度
"let Tlist_WinWidth=36
"标签列表窗口显示或隐藏不影响整个 gvim 窗口大小
let Tlist_Inc_Winwidth=0

nnoremap <silent> <F6> :NERDTreeToggle<CR>
"设置 NERDTree 子窗口宽度
"let NERDTreeWinSize=36
"设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
"启动自动打开窗口
"function! StartUp()
"    if 0 == argc()
"        NERDTree
"    end
"endfunction
"autocmd VimEnter * call StartUp()

"source $VIMRUNTIME/ftplugin/man.vim

"选择代码折叠类型
set foldmethod=syntax
"启动 vim 时不要自动折叠代码
set foldlevel=100

"使用 Grep.vim 插件在工程内全局查找,设置快捷键。快捷键速记法:search in project
nnoremap <Leader>s :Grep<CR>
