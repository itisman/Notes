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

    " markdown{
        au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
        au BufNewFile,BufFilePre,BufRead *.xsjslib set filetype=javascript
        au BufNewFile,BufFilePre,BufRead *.xsjs set filetype=javasript
    " }

    " Row Number {
        " set relativenumber {
            "autocmd InsertEnter * :set norelativenumber number
            "autocmd InsertLeave * :set relativenumber
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
        Plugin 'scrooloose/nerdtree.git'
        Plugin 'digitaltoad/vim-jade'
        Plugin 'kien/ctrlp.vim'
        Plugin 'mattn/emmet-vim'        		
		Plugin 'bling/vim-airline' "It can integration with multiple plugin		
		Plugin 'tpope/vim-fugitive'		        
		Plugin 'scrooloose/nerdcommenter'
		
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
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
		let g:syntastic_javascript_jshint_args = '--config "F:\CGP\Workspace\GITHUB\Notes\.jshintrc"'
        let g:syntastic_javascript_checkers = ['jshint']
        "let g:syntastic_javascript_jshint_exec='C:\Users\Administrator\AppData\Roaming\npm\jshint.cmd'   "need this only if jshint do not installed in global
        
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
 
    " NERDTree {
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        let NERDTreeShowBookmarks=1 "Let NERDTree show bookmarks always.
        let NERDTreeChDirMode=2 "Auto set VIM pwd directory as default when open bookmarks
		"let no_buffers_menu=1
    " }	
	
	" jsbeautify {
		map <Leader>ff :call JsBeautify()<cr>
		autocmd FileType javascript noremap <buffer>  <Leader>ff :call JsBeautify()<cr>
		autocmd FileType json noremap <buffer> <Leader>ff :call JsonBeautify()<cr>
		autocmd FileType jsx noremap <buffer> <Leader>ff :call JsxBeautify()<cr>
		autocmd FileType html noremap <buffer> <Leader>ff :call HtmlBeautify()<cr>
		autocmd FileType css noremap <buffer> <Leader>ff :call CSSBeautify()<cr>
		
		autocmd FileType javascript vnoremap <buffer>  <Leader>ff :call RangeJsBeautify()<cr>
		autocmd FileType json vnoremap <buffer> <Leader>ff :call RangeJsonBeautify()<cr>
		autocmd FileType jsx vnoremap <buffer> <Leader>ff :call RangeJsxBeautify()<cr>
		autocmd FileType html vnoremap <buffer> <Leader>ff :call RangeHtmlBeautify()<cr>
		autocmd FileType css vnoremap <buffer> <Leader>ff :call RangeCSSBeautify()<cr>
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
    map <Leader>t :NERDTreeToggle<CR>		"Nerdtree
	
    map <Leader>dd :cd %:p:h<CR> :pwd<CR>		"Current Dir
	map <Leader>dw :! explorer .<CR> 		"Explorer
	
    map <Leader>cw :copen<CR> 				"Open
    map <Leader>ccl :ccl<CR>				"Close
	"map <Leader>cc :cc<CR>					"details
	"map <Leader>cp :cp<CR>					"Previous
	"map <Leader>cn :cn<CR>					"Next
	"map <Leader>cl :cl<CR>					"List all 
	"map <Leader>col :col<CR>				"Old List
	"map <Leader>cnew :cnew<CR>				"New List
	
	map <Leader>ew :Errors<CR> 				"Error Open
	map <Leader>ecl :lclose<CR> 			"Error Close
	map <Leader>en :lnext<CR> 				"Error Next
	map <Leader>ep :lprev<CR> 				"Error Prev
" }


" Footer {
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim		
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
" }


  
