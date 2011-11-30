" GENERAL
set nocompatible                  " Turn of Vi compatibility.

filetype off                    " force reloading *after* pathogen loaded

" PATHOGEN
call pathogen#infect()

filetype plugin indent on               " enable detection, plugins.

set visualbell                          " Do not flash the screen when error occurs.
set noerrorbells                        " no audible signal as well.

syntax on                               " Syntax coloring on.
set synmaxcol=2048                      " Maximum number of columns to search for syntax items.
set linespace=3                         " Set the line height.
set scrolloff=2                         " Keep the cursor padded with lines when scrolling.
set sidescrolloff=2                     " Keep the cursor padded when side scrolling.
set backspace=2                         " Allow backspacing over anything.
set nowrap                              " Do not wrap long lines.
set nostartofline                       " Leave the cursor where it was.
set mousehide                           " Hide the mouse cursor while typing.
set mouse=nvi                           " Allow the mouse in Normal, Visual and Insert mode.
set sessionoptions-=options,folds,slash " Don't save these settings to a session file.
let mapleader=","                       " Use this character instead of '/'.

" SYSTEM
set encoding=utf-8
set autoread                       " Detect changes made outside of VIM and reload the buffer.
set backupdir=$TEMP                " Save backup
set noswapfile                     " Disable swapfiles, the collide all the time.
set hidden                         " Allow changing from an unsaved buffer.
set debug=msg                      " Error messages don't disappear after one second on startup.

" SHELL
set shellslash                " Although backslashes suck, EasyTag and Syntastic conflict with 'shellslash'.

" UNDO
set undodir=$TEMP
set undofile
set undolevels=1000         " maximum number of changes that can be undone
set undoreload=10000        " maximum number lines to save for undo on a buffer reload

" PASTE
set pastetoggle=<F2>        " Disable indenting when pasting from outside VIM.

" FORMATING
set formatoptions=croq                  " t
"                 ||||                  " |
"                 ||||                  " + Break text on textwidth.
"                 |||+ Let 'gq' format comments.
"                 ||+ Insert * when using 'O' or 'o' in Normal mode.
"                 |+ Insert * when typing <Enter> in Insert mode.
"                 + Break comment on textwidth.
set comments=sl:/**,mb:\ *,exl:\ */,sr:/*,mb:*,exl:*/,://

" FOLDING
set foldenable                                                       " Turn folding on.
set foldmethod=syntax                                                " How the fold is used
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " Open folded text on these actions.

" INDENT
filetype indent on " Indentation based on filetype.
set smartindent    " Use intelligent indentation for C
set autoindent     " Use the indentation of the previous line.
set cindent        " Use C style indentation.

" TABS
set shiftwidth=4 " Number of spaces for an indent.
set tabstop=4    " Tab equals N space(bar)s.
set expandtab    " Convert tabs to spaces.
set smarttab     " A Tab expands to spaces in front of a line.

" GUI TABS
set tabpagemax=15
map <leader>tc :tabclose<cr>
map <leader>te :tabedit
map <leader>tm :tabmove
map <leader>tt :tabnew<cr>

set guitablabel=%N\ %t

" ARROW KEYS
" Use the HJKL keys for navigation. NO CHEATING WITH ARROW KEYS!
noremap <up> <nop>
nnoremap <up> <nop>
vnoremap <up> <nop>
inoremap <up> <nop>

noremap <down> <nop>
nnoremap <down> <nop>
vnoremap <down> <nop>
inoremap <down> <nop>

noremap <left> <nop>
nnoremap <left> <nop>
vnoremap <left> <nop>
inoremap <left> <nop>

noremap <right> <nop>
nnoremap <right> <nop>
vnoremap <right> <nop>
inoremap <right> <nop>

" WINDOWS
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" HELP / MANUAL
" F1 key for Escape key, instead of help. That is the key I want to hit!
noremap  <F1> <Esc>
inoremap <F1> <Esc>

" Nullify the <shift -k> for manual.
nnoremap K <nop>

" Change working directory to the current file path.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR> 

" Map ; to : as well, to prevent typo.
nnoremap ; :

" Faster ESC
inoremap jk <esc>

" USER INTERFACE

" Different cursors for different modes.
set guicursor=n-c:block-Cursor-blinkon0
set guicursor+=v:block-vCursor-blinkon0
set guicursor+=i-ci:ver20-iCursor

highlight SpellBad term=underline gui=undercurl guisp=Orange

" SOLARIZED COLOR SCHEME
set background=dark                 " background settings for solarized
let g:solarized_hitrail=1           " Correct the high contrast characters in the cursorline.

colorscheme solarized               " Color scheme of VIM.

set guioptions=ace
"              |||
"              ||+ Use simple dialogs rather then popups
"              |+ Use GUI tabs, not console style tabs.
"              + Autoselect and yank the text to system clipboard. 
" set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI " Set the GUI font.
set guifont=Consolas:h9:cANSI " Set the GUI font.

set showmatch         " Show matching brace.
set relativenumber    " Show line numbers relative to the current line.
set fillchars=""      " No characters in windows separators.
set lazyredraw        " Don't redraw while performing macros.
set shortmess=atI
"             |||
"             ||+ Disable intro screen.
"             |+ Truncate file message at the start if path doesn't fit.
"             + Collection of abbriviating methods.
set virtualedit=block " Allow the cursor on non-character positions.

if v:lang =~ "NL"
    autocmd GUIEnter * simalt ~ m " Start maximize!
"                              |
"                              + Maximize in Dutch version (for some reason we use Dutch Windows at work).
else
    autocmd GUIEnter * simalt ~ x " Start maximize!
    "                           |
    "                           + Maximize in English version.
endif

" LIST
set list                                                            " Show tabs and end of lines as character.
set listchars=tab:>\ ,trail:·,extends:»,precedes:«,nbsp:+,eol:¬     " Define the characters to represent tab / EOL.

" STATUSLINE
set laststatus=2
set statusline=%F\ %m\ %r\ %y\ %{fugitive#statusline()}%=%(Line:\ %l/%L\ [%p%%]\ Col:\ %c\ Buf:\ #%n%)\
"               |   |   |   |    |                     |           |  |    |            |          |
"               |   |   |   |    |                     |           |  |    |            |          + Buffer.
"               |   |   |   |    |                     |           |  |    |            + Column number.
"               |   |   |   |    |                     |           |  |    + Percentage of file.
"               |   |   |   |    |                     |           |  + Total number of lines.
"               |   |   |   |    |                     |           + Line number.
"               |   |   |   |    |                     + Define a group and make it right aligned.
"               |   |   |   |    + Show Git repository status.
"               |   |   |   + Filetype mode.
"               |   |   + Read Only flag.
"               |   + Modified flag.
"               + Full path to file.

set wildmenu                   " Turn on command line completion wild style.
set wildmode=list:longest      " List all matches and complete to the longest string.
set showmode                   " Show in which mode it is in.
set showcmd                    " Show the command being used.
set cmdheight=2                " Set the command height under the statusline.

" CURSORLINE
set cursorline  " Highlight the line where the cursor is.

" SEARCH
set ignorecase " ignore case in search.
set incsearch  " Start search while typing.
set hlsearch   " Highlight the search results.
set wrapscan   " Search from to the beginning of the file, when the end is reached.
set smartcase  " when capitals are used, activate case-sensitive search automatically 
set gdefault   " Use global(g) option by default.
set path+=./** " Search recursively down the current path.

" Disable highlighted search results.
map <leader><space> :noh<cr> 

" Use sane regex in normal mode.
nnoremap / /\v
vnoremap / /\v

" Substitute
nnoremap <leader>s :%s//<left>

" open URL under cursor in browser.
function! OpenURL(url)
exe "!start cmd /cstart /b ".a:url.""
    redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

nnoremap gb :OpenURL <cfile><CR>
nnoremap gS :OpenURL http://www.stackoverflow.com/search?q=<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>


" ANY FILE
 " Save when losing focus.
autocmd FocusLost * :w

" Highlight lines that are longer than 74 characters.
autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
autocmd BufEnter * match OverLength /\%74v.*/

" Resize splits when the window is resized
autocmd VimResized * exe "normal! \<c-w>="

" VIMRC
" Source the vimrc file after saving it.
autocmd bufwritepost _vimrc source $MYVIMRC 

" Make _vimrc easy accessible.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" ACTIONSCRIPT 
" ActionScript. Override the standard Altas (*.as).
autocmd BufNewFile,BufRead *.as set filetype=actionscript
" autocmd FileType actionscript set dictionary=$HOME/vimfiles/dict/actionscript.dict
autocmd FileType actionscript map <C-Enter> :silent !test_movie.jsfl<cr>
autocmd FileType actionscript map <S-C-Enter> :silent !publish_all.jsfl<cr>

" JAVASCRIPT
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set makeprg=jshint\ %
autocmd FileType javascript set errorformat=%l:%c\ ->\ %m

autocmd FileType javascript nnoremap gJ :OpenURL https://developer.mozilla.org/en-US/search?q=<cword><CR>
autocmd FileType javascript nnoremap gQ :OpenURL http://api.jquery.com/<cword><CR>

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set makeprg=tidy\ -quiet\ -errors\ %
autocmd FileType html set errorformat=line\ %l\ column\ %v\ -\ %m
" autocmd FileType html set makeprg="tidy --new-blocklevel-tags 'section, article, aside, hgroup, header, footer, nav, figure, figcaption' --new-inline-tags 'video, audio, embed, mark, progress, meter, time, ruby, rt, rp, canvas, command, details, datalist' --new-empty-tags 'wbr, keygen' -e ".shellescape(expand('%'))." 2>&1 \\| grep -v '\<table\> lacks \"summary\" attribute' \\| grep -v 'not approved by W3C'"

" CSS
autocmd FileType css set foldmethod=marker
autocmd FileType css set foldmarker={,}
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
let javascript_enable_domhtmlcss=1

" JSFL
autocmd BufNewFile,BufRead *.jsfl set filetype=javascript
"
" VIMOUTLINER
autocmd BufRead,BufNewFile *.otl set filetype=vo_base
autocmd BufRead,BufNewFile *.oln set filetype=xoutliner

" TAGBAR
" Manual add a tags file to the current directory, include subdirs as well.
nmap <leader><insert> :silent !ctags -aR *<cr> 

let g:tagbar_usearrows=1
nnoremap <leader>l :TagbarToggle<CR>

" NETRW
let g:netrw_liststyle=3   " Show tree style listing.

" NERDTREE
noremap <leader>n :NERDTreeToggle<cr> " Toggle the NERDTree side window.
noremap <leader>nf :NERDTreeFind<cr>  " Find the current file in NERDTree.
let NERDTreeHighlightCursorLine=1
let NERDTreeIgnore=[]
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" NERD COMMENTER
let NERDSpaceDelims=1    " Pad the opening comment delimiter with a space.

" SNIPMATE 
let g:snip_author='Pascal Immerzeel'
nnoremap <leader>es :vsplit ~/vimfiles/snippets/<cr>

" SYNTASTIC
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1

" ZENCODING
let g:user_zen_leader_key = "<c-e>"

" YANKRING
nnoremap <leader>y :YRShow<CR>

" MATCHIT
" Using the plugin distributed with VIM
runtime macros/matchit.vim

" NON PUBLIC SETTINGS
" so ~/_vimrc_private
