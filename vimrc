set nocompatible " nocp

if has("autocmd")
	" Begin vundle configure
	filetype off
	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle
	" required!
	Plugin 'gmarik/Vundle.vim'

	" The following are example of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on Github repo
	"Plugin 'tpope/vim-fugitive' " git in vim
	"Plugin 'drmingdrmer/xptemplate' " snippet
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'rdnetto/YCM-Generator'

	" Plugin from http://vim-scripts.org/vim/scripts.html
	Plugin 'taglist.vim'
	" Plugin 'L9'
	"Plugin 'c.vim'
	"Plugin 'Vim-Support'
	"Plugin 'bash-support.vim'

	" Git plugin not hosted on Github
	"Plugin 'git://git.wincent.com/command-t.git'

	" git repos on your local machine (i.e. when working on your own plugin)
	"Plugin 'file:///home/gmarik/path/to/plugin'

	" The sparkup vim script is in a subdirectory of this repo called vim
	" Pass the path to set the runtimepath properly
	"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

	" Avoid a name conflict with L9
	"Plugin 'user/L9', {'name': 'newL9'}

	" All of your Plugins must be added before the following line
	call vundle#end()
	filetype plugin indent on
	" To ignore plugin indent changes, instead use:
	"filetype plugin on 
	"
	" Brief help
	" :PluginList - list configured plugins
	" :PluginInstall(!) - install (update) plugins
	" :PluginSearch(!) foo - search (or refresh cache first) for foo
	" :PluginClean(!) - confirm (or auto-approve) removel of unused plugins
	"
	" see :h vundle for more details or wiki for FAQ
	" End vundle configure, put your non-Plugin stuff after this line

	syntax on
endif

set backspace=indent,eol,start
"set cursorline
"set cursorcolumn
set number
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2 " 0 no seperate statusline, 1 one for >=2 buffer, 2 for all
"set ruler " x,y z% at the leftdown corner
set nohlsearch

" Tab
set tabstop=4 " ts, tab equal 4 spaces
"set softtabstop= " sts, 
set shiftwidth=4 " sw, > 4 spaces
"set expandtab " et, replace tab with spaces
set smarttab " st, one Backspace delete 4 spaces indents

"set textwidth=80 " Text Width, wrap the text
set linebreak " lbr, no line break between words
"set sm " parenthesis match

" buffer configure
set hidden

" Indent
"set cindent " cin
"set smartindent " si

" Encoding
"set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,latin1
"set termencoding=utf-8

" font
if has("unix")
	set guifontwide=WenQuanYi\ Zen\ Hei\ Mono
endif

"set display=lastline

"set virtualedit=all " ve, let curser can position anywhere
colorscheme molokai
set t_Co=256
"nnoremap <silent> <F7> :TlistToggle<CR>

let loaded_matchparen=1

"---------------------------------------------------------------------
" YouCompleteMe
"---------------------------------------------------------------------
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1, 'python': 1, 'vim': 1}
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

"---------------------------------------------------------------------
" configure according to filetype
"---------------------------------------------------------------------

function CppConf()
	setlocal cindent
	nnoremap <silent> <F7> :TlistToggle<CR>
endfunction	

if has("autocmd")
	autocmd FileType *.c,*.cpp,*.h call CppConf()
	autocmd FileType xml setlocal ts=2 sts=0 sw=2
	autocmd FileType html setlocal ts=2 sts=0 sw=2
endif
