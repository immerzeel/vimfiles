"  {
set nocompatible                  " Turn of Vi compatibility.

filetype off                    " force reloading *after* pathogen loaded

" }
" VUNDLE {
" Download and install Vundle if no directory in bundle.
if !isdirectory(expand('~/.vim/bundle/vundle'))
  exec '!git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle'
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'

Bundle 'thinca/vim-quickrun'
Bundle 'tyru/open-browser.vim'
Bundle 'mileszs/ack.vim'

Bundle 'jelera/vim-javascript-syntax'
Bundle 'jshint.vim'

Bundle 'VisIncr'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-list:smartinput'
Bundle 'majutsushi/tagbar'

Bundle 'mattn/gist-vim'
Bundle 'mattn/zencoding-vim'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-haml'

Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/webapi-vim'
Bundle 'kana/vspec'

Bundle 'msanders/cocoa.vim'
" }
" SYSTEM {
filetype plugin indent on               " enable detection, plugins.

set novisualbell                        " Do not flash the screen when error occurs.
set noerrorbells                        " no audible signal as well.

syntax on                               " Syntax coloring on.
set encoding=utf-8                      " Default setting.
set fileformat=unix                     " Set always to UNIX line ends."
set backspace=2                         " Allow backspacing over anything.
set nostartofline                       " Leave the cursor where it was.
let mapleader=','                       " Use this character instead of '/'.
let maplocalleader='\'

" set debug=msg                      " Error messages don't disappear after one second on startup.

" }
" MOUSE {
set mousehide                           " Hide the mouse cursor while typing.
set mouse=nvi                           " Allow the mouse in Normal, Visual and Insert mode.
" }
" WRAP & WINDOW LIMITS {
set textwidth=80                        " Set maximum line width.
set nowrap                              " Do not wrap long lines.

 " Use visual lines, not text object line.
noremap j gj
noremap k gk
" }
" BACKUP & SWAP {
set nobackup                       " No backup files
set noswapfile                     " Disable swapfiles, they collide all the time.

 " Save when losing focus.
autocmd FocusLost * :wa

" }
" SHELL {
set shellslash               " Although backslashes suck, some plugins conflict with 'shellslash'.

" Change working directory to the current file path.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" }
" HELP {
" Disable the help button, Apple's keyboard is hard enough.
nnoremap <F1> <nop>
" }
" DIFF {
set diffopt=vertical         " Use vertical split for diff mode.
" }
" UNDO {
set undodir=$TEMP
set undofile
set undolevels=1000         " maximum number of changes that can be undone
set undoreload=10000        " maximum number lines to save for undo on a buffer reload
" }
" COPY/PASTE CLIPBOARD {
set pastetoggle=<F2>        " Disable indenting when pasting from outside VIM.
set clipboard=unnamed       " Cut/Copy in the OS will be P abled.
" }
" FORMATING {
set formatoptions=croq                  " t
"                 ||||                    |
"                 ||||                    + Break text on textwidth.
"                 |||+ Let 'gq' format comments.
"                 ||+ Insert * when using 'O' or 'o' in Normal mode.
"                 |+ Insert * when typing <Enter> in Insert mode.
"                 + Break comment on textwidth.
set comments=sl:/**,mb:\ *,exl:\ */,sr:/*,mb:*,exl:*/,://
" Format paragraph.
nnoremap Q gqip 
" }
" FOLDING {
set foldenable                                                       " Turn folding on.
set foldmethod=marker                                                " How the fold is used
set foldmarker={,}                                                   " Fold on curly braces by default. Change in 'augroup'.
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " Open folded text on these actions.
set foldlevelstart=0                                                 " Allow folds at highest level.

nnoremap <leader>z zMzvzz       " Focus on the current fold.
nnoremap <space> za             " Toggle folders open/close.
" }
" INDENT {
filetype indent on " Indentation based on filetype.
set smartindent    " Use intelligent indentation for C
set autoindent     " Use the indentation of the previous line.
set cindent        " Use C style indentation.
" }
" TABS {
set shiftwidth=4 " Number of spaces for an indent.
set tabstop=4    " Tab equals N space(bar)s.
set expandtab    " Convert tabs to spaces.
set smarttab     " A Tab expands to spaces in front of a line.
" }
" BUFFERS {
set splitbelow  " Put the new windows on the bottor on horizontal split.
set splitright  " Put the new window on the right on vertical split.
"
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Split vertically.
noremap <leader>v <C-w>v

set autoread                       " Detect changes made outside of VIM and reload the buffer.
set hidden                         " Allow changing from an unsaved buffer.
" }
" COLORSCHEME {
set background=dark                 " background settings for solarized
let g:solarized_hitrail=1           " Correct the high contrast characters in the cursorline.

colorscheme solarized               " Color scheme of VIM.
" }
" GUI OPTIONS {
set guioptions=ace
"              |||
"              ||+ Use simple dialogs rather then popups
"              |+ Use GUI tabs, not console style tabs.
"              + Autoselect and yank the text to system clipboard.
" set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI " Set the GUI font.

if has('win32')
    set guifont=Consolas:h10:cANSI " Set the GUI font.
    " Start maximize!
    autocmd GUIEnter * simalt ~ x
endif

if has('gui_macvim')
    set guifont=Monaco:h15 " Set the GUI font.
endif

set showmatch         " Show matching brace.
set matchtime=5       " Blink the matching brace X times.
set fillchars=""      " No characters in windows separators.
set lazyredraw        " Don't redraw while performing macros.
set shortmess=atIA
"             |||
"             ||+ Disable intro screen.
"             |+ Truncate file message at the start if path doesn't fit.
"             + Collection of abbriviating methods.
set virtualedit=block " Allow the cursor on non-character positions.
" }
" LIST & LINE NUMBERS {
set list                                                            " Show tabs and end of lines as character.

" Define the characters to represent tab / EOL.
set listchars=tab:\ \
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:+
set listchars+=eol:¬ 

set relativenumber " Show relatively numbered lines.
" Toggle relative/absolute number in Insert/Normal mode.
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
" }
" STATUSLINE {
set laststatus=2
set statusline=%F\ %m\ %r\ %y\ %=%(Line:\ %l/%L\ [%p%%]\ Col:\ %c\ Buf:\ #%n%)\

set wildmenu                   " Turn on command line completion wild style.
set wildmode=full              " List all matches and complete to the longest string.
set wildignore+=.git,.svn      " Ignore Version Control files and directories.
set showmode                   " Show in which mode it is in.
set showcmd                    " Show the command being used.
set cmdheight=2                " Set the command height under the statusline.
" }
" CURSOR {
set colorcolumn=+1 " Highlight the 'textwidth' with a vertical line.
set cursorline     " Highlight the line where the cursor is.
" }
" SEARCH {
set ignorecase " ignore case in search.
set incsearch  " Start search while typing.
set hlsearch   " Highlight the search results.
set wrapscan   " Search from to the beginning of the file, when the end is reached.
set smartcase  " when capitals are used, activate case-sensitive search automatically
set gdefault   " Use global(g) option by default.
set path+=./** " Search recursively down the current path.

" Disable highlighted search results.
noremap <leader><space> :noh<cr>

" Use sane regex in normal mode.
nnoremap / /\v
vnoremap / /\v

" Run yanked/selected regex.
vnoremap <leader>xr y/<c-r>0<cr>
nnoremap <leader>xr ^vg_y/<c-r>0<cr>

" Substitute
nnoremap <leader>s :%s//<left>
nnoremap <Leader>S :%s/<c-r><c-w><cr>//c<left><left>
" }
" ANY FILE {

" Resize splits when the window is resized
autocmd VimResized * exe "normal! \<c-w>="
" }
" VIMRC {
augroup ft_vimrc
    autocmd!

    " Source the vimrc file after saving it.
    autocmd BufWritePost .vimrc source $MYVIMRC

    " Set to empty, defaults to Vim's internal help.
    autocmd FileType vim setlocal keywordprg=:help

augroup END

" Make _vimrc easy accessible.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" }
" QUICKFIX {
augroup ft_quickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap
augroup END
" }
" ACTIONSCRIPT {
augroup ft_actionscript
    autocmd!

    " ActionScript. Override the standard Altas (*.as).
    autocmd BufNewFile,BufRead *.as setlocal filetype=actionscript

    autocmd FileType actionscript noremap <buffer> <C-Enter> :silent !test_movie.jsfl<cr>
    autocmd FileType actionscript noremap <buffer> <S-C-Enter> :silent !publish_all.jsfl<cr>
augroup END

" }
" JAVASCRIPT {
augroup ft_javascript
    autocmd!

    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal nofoldenable
augroup END
" }
" JSON {
augroup ft_json
    autocmd!

    autocmd BufNewFile,BufRead *.json setlocal filetype=json syntax=javascript
augroup END
" }
" HTML {
augroup ft_html
    autocmd!

    autocmd FileType html,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html,xhtml setlocal makeprg=tidy\ -quiet\ -errors\ %
    autocmd FileType html,xhtml setlocal errorformat=line\ %l\ column\ %v\ -\ %m
    autocmd FileType html,xhtml setlocal iskeyword+=-,_

    " Fold the current tag.
    autocmd FileType html,xhtml nnoremap <buffer> <localleader>f Vatzf
augroup END

" }
" PHP {
augroup ft_php
    autocmd!

    autocmd FileType php setlocal iskeyword+=_
    autocmd FileType php setlocal keywordprg=:OpenBrowser http://api.drupal.org/api/search/7/api/search/4.7/
augroup END

" }
" MARKDOWN {
augroup ft_markdown
    autocmd!

    autocmd BufNewFile,BufRead *.m*down setlocal filetype=markdown

    " Add headings.
    autocmd Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    autocmd Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    autocmd Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END
" }
" CSS / SCSS {
augroup ft_css
    autocmd!

    autocmd FileType css,scss setlocal foldmethod=marker
    autocmd FileType css,scss setlocal foldmarker={,}
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType css,scss setlocal iskeyword+=-

    autocmd BufNewFile,BufRead *.css,*.scss nnoremap <buffer> <localleader>S viB<cr>:sort<cr>:noh<cr>
augroup END

let javascript_enable_domhtmlcss=1
" }
" NEOCOMPLCACHE {
let g:neocomplcache_enable_at_startup = 1 " Enable the plugin.
" }
" TAGBAR {
" Manual add a tags file to the current directory, include subdirs as well.
nnoremap <leader>tg :silent !ctags -aR *<cr>
set tags=tags;/ " Look up the directory for tags files.

let g:tagbar_usearrows=1
nnoremap <leader>t :TagbarToggle<cr>

" }
" NETRW {
let g:netrw_liststyle=3                        " Show tree style listing.
let g:netrw_winsize=200                        " Width of the opened NETRW window.
let g:netrw_altv=1                             " Open new window vertically to the right.
let g:netrw_rsync_cmd="rsync -Raze"            " Extra options for rsyc.
" }
" NERDTREE {
noremap <leader>n  :NERDTreeToggle<cr>
noremap <leader>nf :NERDTreeFind<cr>
" }
" RAGTAG {
let g:ragtag_global_maps=1 " Enable global mappings.

" }
" MATCHIT {
" Using the plugin distributed with VIM
runtime macros/matchit.vim

" }
" GIST {
let g:gist_clip_command='pbcopy'
let g:gist_open_browser_after_post=1
let g:gist_detect_filetype=1
" }
" EX {
" Move on the commandline like in the shell.
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" }
" CUSTOM REMAPS {

" Clean whitespace
noremap <leader>W  :%s/\s\+$//<cr>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" }
" NON PUBLIC SETTINGS {
" so ~/_vimrc_private
" If an .exrc exists, source it.
if filereadable(".exrc")
    echom "Local .exrc loaded."
    source .exrc
endif
" }
