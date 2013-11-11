" Enable Pathogen, so that we can use color schemes installed via Pathogen
call pathogen#infect()

" Enable syntax highlighting
syntax on

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

" Treat *.as files as ActionScript
au BufNewFile,BufRead *.as             set filetype=actionscript

" When running mvim/gvim, show a nice big window with pleasant colors.
if has( "gui_running" )
    set columns=100
    set lines=60
    set guifont=DejaVu_Sans_Mono:h9
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

" Let's start at the first line for git commits (overrides vim's memorized
" positioning).
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Make <leader>b quickly switch buffers
nnoremap <leader>b :ls <CR>:b<space>

" Make 'ci(' automatically add trailing/leading spaces
onoremap i( i(  <left>

" Make ",cd" change the working directory to the directory of the file being
" edited; also print the new working directory after changing.
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" A little shortcut to stage the currently edited file, uses vim-fugitive
command Gadd Git add %:p

