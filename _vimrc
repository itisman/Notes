" Add following config in vim to point the configration source to this file: source /path/here


" General {
    " Basic {
        set nocompatible
        filetype off " required
        colorscheme desert "set theme 
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
        set backupdir=$HOME/VIMBackup
        set directory=$HOME/VIMBackup
        set undodir=$HOME/VIMBackjup		
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
    set rtp+=~/vimfiles/bundle/Vundle.vim/  "set the runtime path to include Vundle and initialize
    let path='~/vimfiles/bundle'    " alternatively, pass a path where Vundle should install plugins

    " Plugin {
        call vundle#begin(path) "call vundle#begin('~/some/path/here')

        Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle
        Plugin 'Syntastic' "need to install jshint (npm install -g jshint)
        Plugin 'maksimr/vim-jsbeautify'
        Plugin 'einars/js-beautify'
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
        Plugin 'posva/vim-vue'
        Plugin 'airblade/vim-gitgutter'
		
		"Plugin 'nathanaelkane/vim-indent-guides'
		"Plugin 'terryma/vim-multiple-cursors'
		"Plugin 'ervandew/supertab'
		"Plugin 'ggreer/the_silver_searcher'
        "Plugin 'petdance/ack2'
        "Plugin 'majutsushi/tagbar' "need ctags5.5        
        "Plugin 'Valloric/YouCompleteMe' "Need multiple front plugin        
        "Plugin 'ggreer/the_silver_searcher'
        "Plugin 'rking/ag.vim'  "replaced by ack2
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
        let g:syntastic_javascript_jshint_args = '--config "F:\CGP\Workspace\GITHUB\Notes\.jshintrc"'
        let g:syntastic_javascript_checkers = ['jshint']
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
    "
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
		" map <Leader>ff :call JsBeautify()<cr>
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
    map <Leader>dw :!start explorer .<CR> 
    
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


  
