filetype off                  " required
colorscheme desert "set theme 




" -- Vundle --
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Syntastic'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'scrooloose/nerdtree.git'
Plugin 'digitaltoad/vim-jade'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"   Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"   Plugin 'L9'
" Git plugin not hosted on GitHub
"   Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"   Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"   Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" -- Common --
"Move down after the bundles so that syntax rules in Bundle Plugins will be used
syn on "syntax on
set ai
set bs=2
set showmatch
set expandtab
set cursorline
set number
set autoread
set ignorecase
set fileencodings=utf-8,gbk
set nocompatible              
set hls
set ruler "Display cursor coordinate at the right-bottom corner
set ambiwidth=double
set guifont=Consolas
set history=100
set softtabstop=4
set smartindent
set smartcase
set autoindent shiftwidth=4
set laststatus=2
set tabstop=4

"Folder
set foldenable
set fdm=indent "foldmethod
set foldnestmax=6
"set foldopen=all
"set foldclose=all

"Avoid auto wrap
set wrap
set linebreak
set nolist
set textwidth=0 
set wrapmargin=0
"set formatoptions, formatoptions need to be reset after open NERDTree
set fo-=t

"set backup and backup directory
set backup
set backupdir=C:\Gaopeng.Chen\VIMbackup
set directory=C:\Gaopeng.Chen\VIMbackup


"markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.xsjslib set filetype=javascript
au BufNewFile,BufFilePre,BufRead *.xsjs set filetype=javasript

"set relative number on insert mode
"set relativenumber
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber



" -- Syntastic --
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_exec='C:\Users\I306517\AppData\Roaming\npm\jshint.cmd'
let g:syntastic_javascript_jshint_args='--config "C:\hana_epm_fpa\config\coding\jshintConfigUI.js"'


" -- NERDTree config --
"F2 to toggle NERDTree
map <F2> :NERDTreeToggle<CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"Auto open NERDTree
"autocmd vimenter * NERDTree C:\Gaopeng.Chen\workspace\hana_epm_fpa\fpa-app\src\sap\fpa\ui\scripts
"Let NERDTree show bookmarks always.
let NERDTreeShowBookmarks=1 
"Auto set VIM pwd directory as default when open bookmarks
let NERDTreeChDirMode=2

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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


"""""""""""""""""""""""""""""
"windows in chinese irrecognizable code
"""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,utf-16,gbk,chinese,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
"set termencoding=utf-8
"if has("win32")
"set fileencoding=chinese
"else
"set fileencoding=utf-8
"endif

"menu irrecognizable code
"set langmenu=zh_CN.utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"console output irrecognizable code
"language messages zh_cn.utf-8
