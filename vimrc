" GENERAL
set nocompatible                  " Turn of Vi compatibility.

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin on                " enable detection, plugins. 

set visualbell                  " Do not flash the screen when error occurs.
set noerrorbells                  " no audible signal as well.

syntax on                         " Syntax coloring on.
set synmaxcol=2048                " Maximum number of columns to search for syntax items.
" set textwidth=79                  " Maximum text width.
set linespace=3                   " Set the line height.
set nowrap                        " Do not wrap long lines.
set scrolloff=2                   " Keep the cursor padded with lines when scrolling.
set sidescrolloff=2               " Keep the cursor padded when side scrolling.
set backspace=2                   " Allow backspacing over anything.
set nostartofline                 " Leave the cursor where it was.
set mousehide                     " Hide the mouse cursor while typing.
set mouse=nvi                     " Allow the mouse in Normal, Visual and Insert mode.
set completeopt=menu              " Don't show extra info on completions.
set sessionoptions-=options,folds,slash " Don't save these settings to a session file.
let mapleader=","                 " Use this character instead of '/'.
set timeoutlen=500                " Shorten the lag after typing the leader key.
set ttimeoutlen=50                " Make ESC work a little bit faster.

" SYSTEM
set encoding=utf-8
set autoread                  " Detect changes made outside of VIM and reload the buffer.
set backupdir=$HOME\.vim-temp " Save backup
set directory=$HOME\.vim-temp " Save swap files in this location.
set autochdir                 " Automatically change the current directory to the file's location.
set hidden                    " Allow changing from an unsaved buffer.
set debug=msg                 " Error messages don't disappear after one second on startup.

" SHELL
set shellslash      " Although backslashes suck, EasyTag conflicts with 'shellslash'.
set shell=powershell
" set shellcmdflag=-c
" set shellxquote=\"
" set shellpipe=\|\ tee

" UNDO
set undodir=$HOME/.vim-undo
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
set foldmethod=manual                                                " How the fold is used
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " Open folded text on these actions.
set foldlevel=30                                                      " Don't autofold. Use manual folding.

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
vnoremap <Space> I<Space><Esc>gv " Add a space before selected block and reselect the previous section.

" USER INTERFACE
set background=dark                " background settings for solarized
colorscheme solarized              " Color scheme of VIM.
set guioptions=ace
"              |||
"              ||+ Use simple dialogs rather then popups
"              |+ Use GUI tabs, not console style tabs.
"              + Autoselect and yank the text to system clipboard. 
" set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI " Set the GUI font.
set guifont=Consolas:h10:cANSI " Set the GUI font.

set showmatch         " Show matching brace.
set relativenumber    " Show line numbers relative to the current line.
set fillchars=""      " No characters in windows separators.
set lazyredraw        " Don't redraw while performing macros.
set shortmess=I       " Disable intro screen.
set virtualedit=block " Allow the cursor on non-character positions.

" Use the HJKL keys for navigation. NO CHEATING WITH ARROW KEYS!
map! <up> <nop>
map! <down> <nop>
map! <left> <nop>
map! <right> <nop>

" Use shortcuts to navigate the windows.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" autocmd GUIEnter * simalt ~ x " Start maximize!
"                           |
"                           + Maximize in English version.
"
autocmd GUIEnter * simalt ~ m " Start maximize!
"                           |
"                           + Maximize in Dutch version (for some reason we use Dutch Windows at work).

" LIST
set list                                                            " Show tabs and end of lines as character.
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬     " Define the characters to represent tab / EOL.

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

set completeopt=longest,menuone 
set wildmenu                   " Turn on command line completion wild style.
" set wildmode=list:longest    " List all matches and complete to the longest string.
set wildmode=longest:full,full " List all matches and complete to the longest string.
set showmode                   " Show in which mode it is in.
set showcmd                    " Show the command being used.
set cmdheight=2                " Set the command height under the statusline.

" CURSORLINE
set cursorline  " Highlight the line where the cursor is.

" SEARCH
set magic      " For use of regular expressions in search
set incsearch  " Start search while typing.
set hlsearch   " Highlight the search results.
set wrapscan   " Search from to the beginning of the file, when the end is reached.
set smartcase  " when capitals are used, activate case-sensitive search automatically 
set gdefault   " Use global(g) option by default.
set path+=./** " Search recursively down the current path.
map <leader><space> :noh<cr> " Disable highlighted search results.

" open URL under cursor in browser.
function! OpenURL(url)
exe "!start cmd /cstart /b ".a:url.""
    redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

nnoremap gb :OpenURL <cfile><CR>
nnoremap gS :OpenURL http://www.stackoverflow.com/search?q=<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>


" VIMRC
autocmd bufwritepost _vimrc source $MYVIMRC " Source the vimrc file after saving it.
nmap <leader>ev :vsplit $MYVIMRC<cr>        " Make _vimrc easy accessible.

" ACTIONSCRIPT 
autocmd BufNewFile,BufRead *.as set filetype=actionscript                          " ActionScript. Override the standard Altas (*.as).
autocmd FileType actionscript set dictionary=$HOME/vimfiles/dict/actionscript.dict
autocmd FileType actionscript map <C-Enter> :silent !test_movie.jsfl<cr>
autocmd FileType actionscript map <S-C-Enter> :silent !publish_all.jsfl<cr>

" JSFL
autocmd BufNewFile,BufRead *.jsfl set filetype=javascript

" VIMOUTLINER
autocmd BufRead,BufNewFile *.otl set filetype=vo_base
autocmd BufRead,BufNewFile *.oln set filetype=xoutliner

" EASYTAGS
nmap <leader><insert> :silent !ctags -aR *<cr> " Manual add a tags file to the current directory, include subdirs aswell.
" set tags=./tags;/.;**/tags                   " Lookup ctags' tags file up the directory, until one is found.
set tags=tags;**/tags                          " Loook up until a 'tags' file is found.
let g:easytags_file='tags'
let g:easytags_include_members=1               " Include class members.

" SNIPMATE 
let g:snip_author='Pascal Immerzeel'
let snippets_dir="$HOME/vimfiles/snippets"

" FUZZYFINDER
let g:fuf_enumeratingLimit=50   " Limit the popup list to 50 items.
let g:fuf_autoPreview=0         " Donot show a preview of selected item.

nnoremap <leader>fd :call fuf#givenfile#launch('', 0, '> ', split(glob('./**/*'), "\n"))<cr>
nnoremap <leader>ff :FufFileWithCurrentBufferDir<cr>
nnoremap <leader>fl :FufLine<cr>
nnoremap <leader>fi :FufFile<cr>
nnoremap <leader>fb :FufBuffer<cr>
nnoremap <leader>ft :FufTaggedFile<cr>
nnoremap <leader>fj :FufJumpList<cr>
nnoremap <leader>fc :FufChangeList<cr>
nnoremap <leader>fq :FufQuickfix<cr>
nnoremap <leader>fh :FufHelp<cr>
nnoremap <leader>fr :FufRenewCache<cr>

" NETRW
let g:netrw_liststyle=3   " Show tree style listing.

" NERDTREE
nmap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=0 " Donot hidden files.
" let NERDCreateDefaultMappings=0 
let NERDShutUp=1
let NERDTreeHijackNetrw=0

" NERD COMMENTER
let NERDSpaceDelims=1    " Pad the opening comment delimiter with a space.

" SYNCTASTIC
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
" let g:syntastic_quiet_warnings=1

" NON PUBLIC SETTINGS
" so ~/_vimrc_private
