# VIM tricks

#### How could I add new file from NERDTree?
----
> `m` show menu 

> `a` Add child node

####  How could I repeat last command?
----
> `.`

####  How could I repeat command on multiple lines?
----
> `:1, 3 norm Ifronter` add fronter at the beginning

> `:exe "1, 3 norm Ifronter"` add fronter at the beginning

####  How to quickly indent lines?
----
> `>>` indent current line 

> `=` indent follow previous line 

> `=%` indent whole code block

> `gg=G` indent whole file

> `=22G` indent from current line to line 22
> ----

> `:>` indent on this line

> `:5>>` indent twice on line5 

####  How to move to matching braces?
----
> `%`

####  How to go to next highlight?
----
> `n` go to next

> `N` go to previous

####  How to search and remove highlight?
----
> `/gaopeng` search gaopeng

> `noh` remove highlight

####  How to explore folder or open file without NERDTree
> ----

> `:Sexplore!` / `Se!` is like :Sexplore, but the splitting will be done vertically.

> `:Hexplore` / `:He` does an :Explore with |:belowright| horizontal splitting.

> `:Hexplore!` / `:He!` does an :Explore with |:aboveleft|  horizontal splitting.

> `:Vexplore` / `:Ve` does an :Explore with |:leftabove|  vertical splitting.

> `:Vexplore!` / `:Ve!` does an :Explore with |:rightbelow| vertical splitting.

> `:Texplore` / `:Te` does a tabnew before generating the browser window

####  How to split screen?
----
> `CTRL + w, c` close current window

> `CTRL + w, s` split current window

> `CTRL + w, v` split current window vertically

> ----

> `:He` Horizontal Spliter

> `:He!` Horizontal Spliter and keep current at the top

####  How to search and replace
----
> [Search and Replace](http://vim.wikia.com/wiki/Search\_and\_replace)

####  How to view as Tab
----
> `:Te`

> ----

> `gt` go to next tab

> `gT` go to previous tab


> `5gt` go to fifth tab

> `:tabs` view all tabs

> `:bufdo tab split` transfer all buffer file to tab

> `:qa` quit all

> `:wqa` save and quit all

####  How to scroll sync on different view?
----
> `:set scb` set scroll bind 

> `:set scb!` close scroll bind

####  How to open last edit view?
----
> *Create a session.*

> `:mks ~/mysession.vim` create a session

> `:so ~/mysession.vim` retrieve the session

> `:mks! ~/mysession.vim` overwrite exsiting session

####  How to auto complete word or sentence?
----
> `CTRL + n` / `CTRL + x, CTRL + n` auto complete word

> `CTRL + x, CTRL + l` auto complete whole line

> `CTRL + x, CTRL + f` auto complete file name

> `CTRL + x, CTRL + k` auto complete dictionary word

> `CTRL + n` next matching

> `CTRL + p` previous matching


####  How to upper case whole line
----
> `gUU` uppercase whole line 

> `guu` lowercase whole line

> `gUw` uppercase current word


####  How to trace back your cursor movment?
----
> `CTRL + O` go back to last place

> `CTRL + I` go forward to next place

####  How to quickly go to one charactor?
----
> `fs` find the latest "s"

> `Fs` find previous "s"

> `3fs`find the third "s"

####  How to replace charactor or sentence place?
----
> `xp` replace charactor position with next charactor

> `ddp` replace the line position with next line

####  How do I search and replace?
----
> `:1,20s/^/Test/g`   insert Test at the begining of line 1 to line 20 without confirm notice

> `:1,20s/^/\/\//gc`  insert // at the begining of line 1 to line 20 with confirm notice

> [Search and Replace](http://vim.wikia.com/wiki/Search\_and\_replace)

####  How can I swap positions of two open files (in splits) in vim?
----
 Starting with this:
     
     ____________________
     | one       | two  |
     |           |      |
     |           |______|
     |           | three|
     |           |      |
     |___________|______|
     Make `three` the active window, then issue the command `ctrl-w, J`. This moves the current window to fill the bottom of the screen, leaving you with:
     
     ____________________
     | one       | two  |
     |           |      |
     |___________|______|
     | three            |
     |                  |
     |__________________|
     Now make either `one` or `two` the active window, then issue the command `ctrl-w, r`. This `rotates` the windows in the current row, leaving you with:
     
     ____________________
     | two       | one  |
     |           |      |
     |___________|______|
     | three            |
     |                  |
     |__________________|
     Now make `two` the active window, and issue the command `ctrl-w, H`. This moves the current window to fill the left of the screen, leaving you with:
     
     ____________________
     | two       | one  |
     |           |      |
     |           |______|
     |           | three|
     |           |      |
     |___________|______|
     As you can see, the manouevre is a bit of a shuffle. With 3 windows, it`s a bit like one of those `tile game` puzzles. I don`t recommand trying this if you have 4 or more windows - you`d be better off closing them then opening them again in the desired positions.
     
     I made a screencast demonstrating how to work with split windows in Vim.

####  How could I page up and page down by keystrokes?
----
> `Ctrl-b`  Move back one full screen

> `Ctrl-f` Move forward one full screen

> `Ctrl-d`  Move forward 1/2 screen

> `Ctrl-u`  Move back (up) 1/2 screen

####  How to change tabs order?
----
> `:tabmove` move to the end

> `:tabmove 0` move to the front

> `:tabmove 3` move to the third one


####  How to cut and replace? 
----

> following command also works for `d`(delete), `y`(copy), `v`(visual)

> `cw`/`ciw`  (cut current word), 

> `caw`       (cut current word and behind space),

> `cc`        (cut the whole line), 

> `c2c`/ `2cc`(cut two lines),

> `c$`/`C`    (cut from current charactor to the end of the line), 

> `2C`        (cut from current charactor to the end of second line),

> `5cl`       (cut 5 charactor after cursor),

> `5ch`       (cut 5 charactor before cursor),

> `ci[`/`ci{` (cut all the charactors between \[ \], it will also works for \{\}, \<\>, \(\), "", '',\`\`)

> `cit`       (cut all the charactors between HTML/XML tags)

> `s`         (Subsitute, cut current charactor), 

> ----

> `:3, 5c` cut from line 3 to line 5
    
####  How to use visual selector?
----
> `v` visual mode

> `o/O` switch front and end 

> `V` whole line selector


####  How to run shell command?
----
> All the shell command should be start with `:!`

> `:! date` show date on the screen

> `:20r!date` keep the date in the file at 20th line

####  How to customize shortcut?
----
> `:map ^p I//<esc><esc>` Add CTRL + p shortcut.<NOTICE: Press CTRL + v + p / CTRL + v, CTRL + p>. it will insert // at the begining of the line, and press **ESC** back to normal mode

> `:unmap ^p              Remove shortcut on CTRL + p

####  What is *ab*?
----
`:ab myemail gaopeng@gmail.com` *myemail* will replace *gaopeng@gmail.com* in future)

####  How to folding?
----

> Basics: 

> `zi`	switch folding on or off

> `za`	toggle current foldoopen/closed

> `zc`	close current fold

> `zR`	open all folds

> `zM`	close all folds

> `zv`	expand folds to reveal cursor

> ----

> Navigation:

> `zj`	move down to top of next fold

> `zk`	move up to bottom of previous fold

> ----

> Advanced:

> `zo`	open current fold

> `zO`	recursively open current fold

> `zc`	close current fold

> `zC`	recursively close current fold

> `za`	toggle current fold

> `zA`	recursively open/close current fold

> `zm`	reduce `foldlevel` by one

> `zM`	close all folds

> `zr`	increase `foldlevel` by one

> `zR`	open all folds

> ----

> [how to fold](http://vimcasts.org/episodes/how-to-fold)

> [Folding](http://vim.wikia.com/wiki/Folding)

####  How to copy inner word ?
----
> `yiw` copy inner word
> `yw` copy outer word

####  How to spell check in VIM ?
----
> `:set spell`  to enable spell check

> `:set nospell`  to disable spell check

> `]s`  Move to next misspelled word after the cursor.  A count before the command can be used to repeat.  *wrapscan* applies.

> `[s`  Like "]s" but search backwards, find the misspelled word before the cursor.  Finding suggestions for bad words:

> `z=`  For the word under/after the cursor, suggest correctly spelled words.  To add words to your own word list:

> `zg`  Add word under the cursor as a good word 

> `zw`	Like `zg` but mark the word as a wrong (bad) word.  If the word already appears in *spellfile* it is turned into a comment line.  See |spellfile-cleanup| for getting rid of those.

####  How to use ":HELP" for VIM?
----
> `CTRL + ]`  to read corresponding topic 

> `CTRL + o`  to return back 

####  How to search value case sensitive?
----
> `:set smartcase`

> ----

> `/copyright`     Case insensitive

> `/Copyright`     Case sensitive

> `/copyright\C`   Case sensitive

> `/Copyright\c`   Case insensitive

####  How to keep the cursor in the middle of the screen?
----
> `zz`  cursor line will be inthe middle of the screen

> `zt`  cursor line will be inthe top of the screen

> `zb`  cursor line will be inthe bottom of the screen

####  How to delete characters?
----
> `3s`  substitute 3 characters

> `c3l` cut 3 characters

> `cfb` change up to the first `b` (including)

> `ct(` change up to the first `(` (excluding)

####  How to toggle Syntastic Error List?
----
> `:Errors` to show error list

> `:lclose` to close error list

####  How to go Jump between Syntastic Errors?
----
> `:lnext` next error

> `:lprev` prev error

####  How to go to exact line in VIM?
----
> `:150` go to line 150

> `150gg` / `150G`  go to line 150

####  How to move the cursor to the end of word.
----
> `e` goes to the end of next word

> `ge`  goes to the end of previous word

#### How to beautify code use jsBeautify?
----
> `:call JsBeautify()`   beautify whole file as JS file

> `:call HtmlBeautify()` beautify whole file as HTML file

> `:call CSSBeautify()` beautify whole file as CSS file

> `:call JsBeautify(1, 10)` beautify line 1 to 10 as JS file

> ----
> **Setup in start up setting in vim:**
> ``` 
> map <c-f> :call JsBeautify()<cr>
> " or
> autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
> " for html
> autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
> " for css or scss
> autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
> " If you want to beautify only selected lines you should use functions RangeJsBeautify, RangeCSSBeautify, RangeHtmlBeautify.
> autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
> autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
> autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
> ```

#### How to count how many lines should be selected?
----
> `d22G` delete from current row to line 22

----
> **Set relative number on startup setting:**
> "set relative number on insert mode
> "set relativenumber
> "autocmd InsertEnter * :set norelativenumber number
> "autocmd InsertLeave * :set relativenumber

