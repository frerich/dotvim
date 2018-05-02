" Enable syntax highlighting
syntax on

" Only highlight syntax up to a certain column, improves responsiveness for files
" with very long lines
set synmaxcol=240

" Make pressing backspace at the beginning of the line go to the
" previous line
set backspace=indent,eol,start

" Enable C indentation mode and tune it:
" l1 makes case statements in C++ switch look nice with curly braces
" g0 aligns "public:" and "private:" and so on with the "class" word.
set cindent cinoptions=l1,g0,(0,W4

" Disable line wrapping (I can deal with lines > 80 columns, thanks)
set nowrap

" Let auto-indentation indent by four spaces
set shiftwidth=4

" Let tab expand to four spaces
set softtabstop=4

" Expand all tabs to spaces
set expandtab

" Enable incremental searching, and highlight search results
set incsearch hlsearch

" Visualize tabs (I don't like them) and trailing space
set list listchars=tab:·\ ,trail:·,extends:>,precedes:<

" Show a colored column in column 80, to indicate where other people start
" to whine. Don't use this with MacVim
" set colorcolumn=80

" Start scrolling downwards from the third-last line. Helps reading IMHO.
set scrolloff=3

" Search case insensitive by default, but switch to case sensitive in case
" the search term contains uppercase characters.
set ignorecase smartcase

" I don't understand what this does, but I don't dare removing it because I'm
" afraid it remove something I got so used to that I don't even recognize it
" as an optional feature.
set wildmode=list:longest

" Make the status bar look nice
set ruler statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Highlight *.docbook files using docbkxml
au BufNewFile,BufRead *.docbook        setfiletype docbkxml

" Highlight Jenkins 'Jenkinsfile' scripts as Groovy
au BufNewFile,BufRead Jenkinsfile      setfiletype groovy

" Treat *.as files as ActionScript
au BufNewFile,BufRead *.as             set filetype=actionscript

" Highlight Squish Build files as JavaScript
au BufNewFile,BufRead configure.cos    set filetype=javascript
au BufNewFile,BufRead Buildfile        set filetype=javascript
au BufNewFile,BufRead Buildsub         set filetype=javascript

if has("win32")
    set directory=%TEMP%
endif

" When running mvim/gvim, show a nice big window with pleasant colors.
if has( "gui_running" )
    set columns=100
    set lines=60
    if has( "win32")
        set guifont=Lucida_Console:h10
    else
        set guifont=DejaVu_Sans_Mono:h9
    endif
    set encoding=utf-8
    colorscheme solarized
    set background=light
else
    colorscheme darkblue
endif

" Use F9 to grep files for word under the cursor
nnoremap <silent> <F9> :Rfindstring<CR>

" Use these source extensions when searching for strings
let Findstr_Default_Filelist = '*.cpp *.c *.h *.asm *.cs *.mm *.java *.docbook *.tcl *.py *.js *.pl *.xml *.xsd .xsl *.ui *.qml *.as'

" Don't consider colon as part of file name, helps with 'CTRL-W f' on findstr
" output
set isfname-=:

" Make 'gf' open the file under the cursor. Useful when walking include files.
map gf :e! <cfile><CR>

let mapleader = "\\"

" Need this to load the cpp.vim indentation plugin which nicely aligns ?:
filetype plugin indent on

" I forgot what this does
set viminfo+=%

function SetGitCommitOptions()
    " Let's start at the first line for git commits (overrides vim's memorized
    " positioning).
    call setpos('.', [0, 1, 1, 0])

    " Disable cindent for this particular case because it makes '(' start
    " an indented block which I don't want.
    set nocindent
endfunction
autocmd FileType gitcommit call SetGitCommitOptions()

" Make <leader>b quickly switch buffers
nnoremap <leader>b :ls <CR>:b<space>

" Make 'ci(' automatically add trailing/leading spaces
onoremap i( i(  <left>

" Make ",cd" change the working directory to the directory of the file being
" edited; also print the new working directory after changing.
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" A little shortcut to stage the currently edited file, uses vim-fugitive
command Gadd Git add %:p

" A shortcut to Ggrep which is less noisy and opens the quickfix list right
" away. <leader>g can be used on a word to invoke it.
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
nnoremap <leader>g :Ggr <cword><CR>

" Enable support for modelines
set modeline
set modelines=5

" Show the list of errors detected by Syntastic automatically, but only
" 3 lines.
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3

" Disable Syntastic for C++ files, it always complains about not being able
" to find header files.
let g:syntastic_cpp_checkers = ['']

" Disable a couple of annoying Python-specific warnings
let g:syntastic_python_pylint_args='-d C0111,C0103,C0301'

" Remove unneeded netrw banner
let g:netrw_banner = 0

" Browse files in netrw as a 'thin' list
let g:netrw_liststyle = 0

