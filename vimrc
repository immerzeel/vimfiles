" GENERAL
set nocompatible                  " Turn of Vi compatibility.

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin on                " enable detection, plugins. 

set novisualbell                  " Do not flash the screen when error occurs.
set noerrorbells                  " no audible signal as well.

syntax on                         " Syntax coloring on.
set synmaxcol=2048                " Maximum number of columns to search for syntax items.
set textwidth=79                  " Maximum text width.
set linespace=3                   " Set the line height.
set nowrap                        " Do not wrap long lines.
set scrolloff=4                   " Keep the cursor padded with lines when scrolling.
set sidescrolloff=4               " Keep the cursor padded when side scrolling.
set backspace=2                   " Allow backslashing over anything.
set nostartofline                 " Leave the cursor where it was.
set mousehide                     " Hide the mouse cursor while typing.
set completeopt=menu              " Don't show extra info on completions.
set sessionoptions-=options,folds " Don't save these settings to a session file.
let mapleader=","                 " Use this character instead of '/'.
set timeoutlen=500                " Shorten the lag after typing the leader key.

" SYSTEM
set encoding=utf-8
set autoread        " Detect changes made outside of VIM and reload the buffer.
set backupdir=$TEMP " Save backup
set directory=$TEMP " Save swap files in this location.
set autochdir       " Automatically change the current directory to the file's location.
set hidden          " Allow changing from an unsaved buffer.
set noshellslash    " Although backslashes suck, EasyTag conflicts with 'shellslash'.

" UNDO
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000         " maximum number of changes that can be undone
set undoreload=10000        " maximum number lines to save for undo on a buffer reload


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

" USER INTERFACE
colorscheme vividchalk              " Color scheme of VIM.
set colorcolumn=+1                  " Show a colored column to indicate the textwidth limit.
highlight ColorColumn guibg=#111111 " Change the color of the colorcolumn.
set guioptions=ace
"              |||
"              ||+ Use simple dialogs rather then popups
"              |+ Use GUI tabs, not console style tabs.
"              + Autoselect and yank the text to system clipboard. 
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI " Set the GUI font.

set showmatch      " Show matching brace.
set relativenumber " Show line numbers relative to the current line.
set fillchars=""   " No characters in windows separators.
set lazyredraw     " Don't redraw while performing macros.
set shortmess=I    " Disable intro screen.

" Use the HJKL keys for navigation. NO CHEATING WITH ARROW KEYS!
map! <up> <nop>
map! <down> <nop>
map! <left> <nop>
map! <right> <nop>

imap ;; <esc>   " Remap the ESC key, to keep the fingers on HOME row.

autocmd GUIEnter * simalt ~ x " Start maximize!
"                           |
"                           + Maximize in English version.
"                           
" autocmd GUIEnter * simalt ~ m " Start maximize!
"                           |
"                           + Maximize in Dutch version (for some reason we use Dutch Windows at work).

" LIST
set list                        " Show tabs and end of lines as character.
set listchars=tab:>\ ,eol:¬     " Define the characters to represent tab / EOL.

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
set wildmenu              " Turn on command line completion wild style.
set wildmode=list:longest " List all matches and complete to the longest string.
set showmode              " Show in which mode it is in.
set showcmd               " Show the command being used.

" CURSORLINE
set cursorline  " Highlight the line where the cursor is.

" SEARCH
set incsearch  " Start search while typing.
set hlsearch   " Highlight the search results.
set wrapscan   " Search from to the beginning of the file, when the end is reached.
set ignorecase " Ignore case-sensitivity in searches.
set gdefault   " Use global(g) option by default.
set path+=./** " Search recursively down the current path.
map <leader><space> :noh<cr> " Disable highlighted search results.


" VIMRC
autocmd bufwritepost _vimrc source $MYVIMRC " Source the vimrc file after saving it.
nmap <leader>ev :vsplit $MYVIMRC<cr>        " Make _vimrc easy accessible.

" ACTIONSCRIPT 
autocmd BufNewFile,BufRead *.as set filetype=actionscript                          " ActionScript. Override the standard Altas (*.as).
autocmd FileType actionscript set dictionary=$HOME/vimfiles/dict/actionscript.dict
autocmd FileType actionscript map <C-Enter> :silent !test_movie.jsfl<cr>
autocmd FileType actionscript map <S-C-Enter> :silent !publish_all.jsfl<cr>

" VIMOUTLINER
autocmd BufRead,BufNewFile *.otl set filetype=vo_base
autocmd BufRead,BufNewFile *.oln set filetype=xoutliner

" EASYTAGS
nmap <leader><insert> :silent !ctags -aR *<cr> " Manual add a tags file to the current directory, include subdirs aswell.
set tags=./tags;/.;**/tags                     " Lookup ctags' tags file up the directory, until one is found.
let g:easytags_file='tags'
let g:easytags_include_members=1               " Include class members.

" SNIPMATE 
let g:snip_author='Pascal Immerzeel'
let snippets_dir=$HOME."/vimfiles/snippets"

" FUZZYFINDER
let g:fuf_enumeratingLimit=50   " Limit the popup list to 50 items.
let g:fuf_autoPreview=0         " Donot show a preview of selected item."

nnoremap <leader>fd :call fuf#givenfile#launch('', 0, '> ', split(glob('./**/*'), "\n"))<cr>
nnoremap <leader>ff :FufFileWithCurrentBufferDir<cr>
nnoremap <leader>fl :FufLine<cr>
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

" NERD COMMENTER
let NERDSpaceDelims=1    " Pad the opening comment delimiter with a space.
let NERDTreeShowHidden=1 " Show hidden files.

" NON PUBLIC SETTINGS
so ~/_vimrc_private
