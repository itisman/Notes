" 1. 在vim安装目录下的配置文件如下内容，用于指向一个新的配置文件： source /path/here
" 2. 打开Vundle的github，clone Vundle 并根据提示做相应的配置： set rtp+=~/.vim/bundle/Vundle.vim/
" 3. 使用PluginInstall安装VIM插件
" 4. 确保已经安装了NODEJS
" 5. 根据配置文件，需要确保$HOME/VIMBackup文件夹存在
" 6. 查看配置文件中的绝对路径，进行相应修改
" 7. 查看其它配置文件。如：~/.editorconfig

" General {
    " Basic {
        set nocompatible
        filetype off " required
        set t_Co=256
        set background=dark
        colorscheme desert "set theme 
        highlight Normal ctermbg=NONE
        highlight nonText ctermbg=NONE
        syn on "syntax on
        set ai
        set mouse+=a
        set clipboard=unnamed
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
        set guifont=Consolas:h10
        set history=100
        set softtabstop=4
        set smartindent
        set smartcase
        set autoindent shiftwidth=4
        set laststatus=2
        set tabstop=4
		set incsearch
		set hlsearch
        set backupcopy=yes
		let mapleader=" "	
    " }

    " Folder {
        set foldenable
        set fdm=indent "foldmethod
        set foldnestmax=6
        "set foldopen=all
        "set foldclose=all
    "} 
    
    " Auto wrap {
        set wrap
        set linebreak
        set nolist
        set textwidth=0 
        set wrapmargin=0
        set fo-=t "set formatoptions, formatoptions need to be reset after open NERDTree
    " }

    " Backup {
        set backup		
        set backupdir=~/.vimbackup
        set directory=~/.vimbackup
        set undodir=~/.vimbackup
    " }

    " Set file type{
        au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
        au BufNewFile,BufFilePre,BufRead *.xsjslib set filetype=javascript
        au BufNewFile,BufFilePre,BufRead *.xsjs set filetype=javasript
    " }

    " Row Number {
        " set relativenumber {
            set relativenumber
            autocmd InsertEnter * :set norelativenumber number
            autocmd InsertLeave * :set relativenumber
        " }
    " }

" }


" Vundle {
	set rtp+=~/.vim/bundle/Vundle.vim/  "set the runtime path to include Vundle and initialize
    let path='~/.vim/bundle'    " alternatively, pass a path where Vundle should install plugi
    "set rtp+=~/vimfiles/bundle/Vundle.vim/  "set the runtime path to include Vundle and initialize
    "let path='~/vimfiles/bundle'    " alternatively, pass a path where Vundle should install plugins

    " Plugin {
        call vundle#begin(path) "call vundle#begin('~/some/path/here')

        Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle
        Plugin 'Syntastic' "need to install jshint (npm install -g jshint)
        Plugin 'einars/js-beautify'
        Plugin 'maksimr/vim-jsbeautify'
        Plugin 'editorconfig/editorconfig-vim'
        "Plugin 'Chiel92/vim-autoformat'
        Plugin 'scrooloose/nerdtree'
        Plugin 'Xuyuanp/nerdtree-git-plugin'
        Plugin 'digitaltoad/vim-jade'
        Plugin 'kien/ctrlp.vim'
        Plugin 'mattn/emmet-vim'        		
		Plugin 'vim-airline/vim-airline'
		Plugin 'tpope/vim-fugitive'		        
		Plugin 'scrooloose/nerdcommenter'
        Plugin 'pangloss/vim-javascript'
        "Plugin 'mxw/vim-jsx'
        "Plugin 'maxmellon/vim-jsx-pretty'
        Plugin 'posva/vim-vue'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'mileszs/ack.vim'
        Plugin 'rking/ag.vim'
		
		"Plugin 'nathanaelkane/vim-indent-guides'
		"Plugin 'terryma/vim-multiple-cursors'
		"Plugin 'ervandew/supertab'
        "Plugin 'petdance/ack2'
        "Plugin 'majutsushi/tagbar' "need ctags5.5        
        "Plugin 'Valloric/YouCompleteMe' "Need multiple front plugin        
        "Plugin 'L9'
        
        " All of your Plugins must be added before the following line
        call vundle#end()            " required
        filetype plugin indent on    " required
    " }
" }


" Plugin {
    " Syntastic {
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_loc_list_height=5
        let g:syntastic_check_on_open = 0
        let g:syntastic_enable_signs = 1
        let g:syntastic_check_on_wq = 1
        let g:syntastic_auto_jump = 3
		let g:syntastic_javascript_jshint_args = '--config "/Users/gaopeng/Desktop/WorkSpace/mine/Notes/.jshintrc"'
        let g:syntastic_javascript_checkers = ['jshint']
        let syntastic_mode_map = { 'passive_filetypes': ['html'] }
        "let g:syntastic_javascript_jshint_exec='jsx-jshint-wrapper'   "need this only if jshint do not installed in global
        "let g:syntastic_javascript_jshint_exec='C:\Users\Administrator\AppData\Roaming\npm\jshint.cmd'   "need this only if jshint do not installed in global
        "let g:syntastic_javascript_checkers = ['eslint']
    " }
    
    " Airline {
        "let g:airline#extensions#tabline#enabled = 1 
        "let g:airline#extensions#tabline#show_splits = 1
        "let g:airline#extensions#tabline#tab_nr_type = 1
        "let g:airline#extensions#tabline#show_buffers = 1
        "let g:airline#extensions#tabline#show_tabs = 0
        "let g:airline_section_b='%{strftime("%c")}'
        "let g:airline_section_y='BN: %{bufnr("%")}'
    " }

    " CtrlP {
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_working_path_mode = 'ra'
        "set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
        set wildignore+=*\\webapp\\*,*\\tmp\\*,*.swp,*.zip,*.exe,*.jar,*.sh  " Windows
        "let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
        "let g:ctrlp_custom_ignore = { \ 'dir':  '\v[\/]\.(git|hg|svn)$', \ 'file': '\v\.(exe|so|dll)$', \ 'link': 'some_bad_symbolic_links', \ }
        "let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
        "let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
    " }

    " Ack/Ag {
        "cnoreabbrev Ack Ack!
        "cnoreabbrev Ag Ag!
        nnoremap <Leader>a :Ag!<Space>
    " }
 
    " NERDTree {
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        let NERDTreeShowBookmarks=1 "Let NERDTree show bookmarks always.
        let NERDTreeChDirMode=2 "Auto set VIM pwd directory as default when open bookmarks
		"let no_buffers_menu=1
    " }	
 
    " NERDTree-git {
        let g:NERDTreeIndicatorMapCustom = {
        \ "Dirty"     : "*",
        \ "Modified"  : "~",
        \ "Staged"    : "=",
        \ "Deleted"   : "-",
        \ "Untracked" : "+",
        \ "Renamed"   : "ren",
        \ "Unmerged"  : "unmerg",
        \ "Clean"     : "",
        \ 'Ignored'   : "igr",
        \ "Unknown"   : "?"
        \ }
    " }	
	
	" jsbeautify {
        "au BufWrite * :Autoformat

		map <Leader>ff :call JsBeautify()<cr>
		autocmd FileType javascript noremap <buffer>  <Leader>ff :call JsBeautify()<cr>
		autocmd FileType json noremap <buffer> <Leader>ff :call JsonBeautify()<cr>
		autocmd FileType jsx noremap <buffer> <Leader>ff :call JsxBeautify()<cr>
		autocmd BufEnter *.jsx noremap <buffer> <Leader>ff :call JsxBeautify()<cr>
		autocmd FileType html noremap <buffer> <Leader>ff :call HtmlBeautify()<cr>
		autocmd FileType css noremap <buffer> <Leader>ff :call CSSBeautify()<cr>
		
		autocmd FileType javascript vnoremap <buffer>  <Leader>ff :call RangeJsBeautify()<cr>
		autocmd FileType json vnoremap <buffer> <Leader>ff :call RangeJsonBeautify()<cr>
		autocmd FileType jsx vnoremap <buffer> <Leader>ff :call RangeJsxBeautify()<cr>
		autocmd BufEnter *.jsx vnoremap <buffer> <Leader>ff :call RangeJsxBeautify()<cr>
		autocmd FileType html vnoremap <buffer> <Leader>ff :call RangeHtmlBeautify()<cr>
		autocmd FileType css vnoremap <buffer> <Leader>ff :call RangeCSSBeautify()<cr>
    " }	
    
    " vim-vue {
        autocmd BufNewFile,BufRead *.vue set ft=vue
    " }	
    
    " vim-jsx {
        "let g:jsx_ext_required = 0 " Allow JSX in normal JS files
        "let g:xml_syntax_folding = 1
    " }	
" }


" Enviroment {
    " Chinese {
        " file display {
            set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936  
            set encoding=utf-8  
            set termencoding=utf-8   
            set imcmdline    
        " }
          
        " menu display {
            set langmenu=zh_CN  
            let $LANG = 'zh_CN.UTF-8'         
        " }
          
        " message display {
            if has("win32")  
                set termencoding=chinese  
                language message zh_CN.UTF-8  
            endif    
        " }
    " }
" }


" Hot Key {	
    "Nerdtree
    map <Leader>t :NERDTreeToggle<CR>

    "Current Dir
    map <Leader>dd :cd %:p:h<CR> :pwd<CR>

  	"Explorer
    "map <Leader>dw :!start explorer .<CR> 
    map <Leader>dw :!open .<CR> 
    
    "Open
    map <Leader>cw :copen<CR>

    "Close
    map <Leader>ccl :ccl<CR>

    "details
	"map <Leader>cc :cc<CR>
    
    "Previous
	"map <Leader>cp :cp<CR>
    
    "Next
	"map <Leader>cn :cn<CR>

    "List all 
	"map <Leader>cl :cl<CR>

    "Old List
	"map <Leader>col :col<CR>

    "New List
	"map <Leader>cnew :cnew<CR>
	
    "Error Open
	map <Leader>ew :Errors<CR>

    "Error Close
	map <Leader>ecl :lclose<CR>

    "Error Next
	map <Leader>en :lnext<CR>

    "Error Prev
	map <Leader>ep :lprev<CR>

    map gb :bn<CR>
    map gB :bp<CR>
" }


" Footer {
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim		
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
" }


  
