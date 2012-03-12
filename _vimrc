" GENERAL {
set nocompatible                  " Turn of Vi compatibility.

filetype off                    " force reloading *after* pathogen loaded

" }
" PATHOGEN {
call pathogen#infect()

" }
" SYSTEM {
filetype plugin indent on               " enable detection, plugins.

set novisualbell                        " Do not flash the screen when error occurs.
set noerrorbells                        " no audible signal as well.

syntax on                               " Syntax coloring on.
set encoding=utf-8                      " Default setting.
set fileformat=unix                     " Set always to UNIX line ends."
set synmaxcol=2048                      " Maximum number of columns to search for syntax items.
set modelines=0                         " No modelines due to security exploits
set backspace=2                         " Allow backspacing over anything.
set nostartofline                       " Leave the cursor where it was.
set sessionoptions-=options,folds,slash " Don't save these settings to a session file.
let mapleader=','                       " Use this character instead of '/'.
let maplocalleader='\'

set debug=msg                      " Error messages don't disappear after one second on startup.

" }
" MOUSE {
set mousehide                           " Hide the mouse cursor while typing.
set mouse=nvi                           " Allow the mouse in Normal, Visual and Insert mode.

" }
" WRAP & WINDOW LIMITS {
set textwidth=80                        " Set maximum line width.
set nowrap                              " Do not wrap long lines.
set linespace=3                         " Set the line height.
set scrolloff=2                         " Keep the cursor padded with lines when scrolling.
set sidescrolloff=2                     " Keep the cursor padded when side scrolling.

 " Use visual lines, not text object line.
map j gj
map k gk

" }
" BACKUP & SWAP {
set nobackup                       " No backup files
set noswapfile                     " Disable swapfiles, they collide all the time.

 " Save when losing focus.
autocmd FocusLost * :wa

" }
" SHELL {
set shellslash               " Although backslashes suck, some plugins conflict with 'shellslash'.
" if has('win32')
"     " Use powershell instead of the default cmd shell.
"     set shell=powershell.exe
"     set shellcmdflag=-c
"     set shellpipe=>
"     set shellredir=>
" endif

" Change working directory to the current file path.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

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

" }
" FOLDING {
set foldenable                                                       " Turn folding on.
set foldmethod=marker                                                " How the fold is used
set foldmarker={,}                                                   " Fold on curly braces by default. Change in 'augroup'.
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " Open folded text on these actions.
set foldlevelstart=0                                                 " Allow folds at highest level.

nnoremap <leader>z zMzvzz       " Focus on the current fold.
nnoremap <space> za             " Toggle folders open/close.

" Set a custom foldtext for a collapsed fold.
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '"\|/\*\|\*/\|{\d\=', '', 'g') " } Added these markers to prevent folding.
  return v:folddashes . sub
endfunction
set foldtext=MyFoldText()

" }
" iPAD {
if &term == "xterm-ipad"
  nnoremap <Tab> <Esc>
  vnoremap <Tab> <Esc>gV
  onoremap <Tab> <Esc>
  inoremap <Tab> <Esc>`^
  inoremap <Leader><Tab> <Tab>
endif
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
" ARROW KEYS {

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

" }
" BUFFERS {
set splitbelow  " Put the new windows on the bottor on horizontal split.
set splitright  " Put the new window on the right on vertical split.
"
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>v <C-w>v

set autoread                       " Detect changes made outside of VIM and reload the buffer.
set hidden                         " Allow changing from an unsaved buffer.

" }
" HELP / MANUAL {

" F1 key for Escape key, instead of help. That is the key I want to hit!
noremap  <F1> <Esc>
inoremap <F1> <Esc>

" Nullify the <shift -k> for manual.
nnoremap K <nop>

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
endif

set showmatch         " Show matching brace.
set matchtime=5       " Blink the matching brace X times.
set fillchars=""      " No characters in windows separators.
set lazyredraw        " Don't redraw while performing macros.
set shortmess=atI
"             |||
"             ||+ Disable intro screen.
"             |+ Truncate file message at the start if path doesn't fit.
"             + Collection of abbriviating methods.
set virtualedit=block " Allow the cursor on non-character positions.

if v:lang =~ "NL"
    " Start maximize!
    autocmd GUIEnter * simalt ~ m
"                              |
"                              + Maximize in Dutch version (for some reason we use Dutch Windows at work).
"                                It uses a different shortcut to maximize the window.
else
    " Start maximize!
    autocmd GUIEnter * simalt ~ x
    "                           |
    "                           + Maximize in English version.
endif

" }
" LIST & LINE NUMBERS {
set list                                                            " Show tabs and end of lines as character.
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:+,eol:¬     " Define the characters to represent tab / EOL.

set relativenumber " Show relatively numbered lines.
" Toggle relative/absolute number in Insert/Normal mode.
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" }
" STATUSLINE {
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
" set wildmode=list:longest    " List all matches and complete to the longest string.
set wildmode=longest,list,full " List all matches and complete to the longest string.
set wildignore+=.git,.svn      " Ignore Version Control files and directories.
set showmode                   " Show in which mode it is in.
set showcmd                    " Show the command being used.
set cmdheight=2                " Set the command height under the statusline.

" }
" CURSOR {
set colorcolumn=+1                      " Highlight the 'textwidth' with a vertical line.
set cursorline                          " Highlight the line where the cursor is.

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
map <leader><space> :noh<cr>

" Use sane regex in normal mode.
nnoremap / /\v
vnoremap / /\v

" Substitute
nnoremap <leader>s :%s//<left>
nnoremap <Leader>S :%s/<c-r>=expand('<cword>')<cr>//c<left><left>
" }
" OPENURL {
" open URL under cursor in browser.
function! OpenURL(url)
    if has('win32')
        exe "!start cmd /cstart /b ".a:url.""
        redraw!
    endif
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

nnoremap gb :OpenURL <cfile><CR>
nnoremap gS :OpenURL http://www.stackoverflow.com/search?q=<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>

" }
" ANY FILE {

" Resize splits when the window is resized
autocmd VimResized * exe "normal! \<c-w>="

" }
" VIMRC {
augroup ft_vimrc
    autocmd!

    " Source the vimrc file after saving it.
    autocmd BufWritePost _vimrc source $MYVIMRC

    " Bind <F1> to show the keyword under cursor
    " general help can still be entered manually, with :h
    autocmd filetype *.vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    autocmd filetype *.vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
augroup END

" Make _vimrc easy accessible.
nnoremap <leader>ev :vsplit $HOME/vimfiles/_vimrc<cr>

" Source
vnoremap <leader>xv y:execute @@<cr>
nnoremap <leader>xv ^vg_y:execute @@<cr>
" }
" PENTADACTYL {
augroup ft_pentadactyl
    au!
    au BufNewFile,BufRead .pentadactylrc set filetype=vim
    nnoremap <leader>ep :vsplit ~/pentafiles/pentadactylrc<cr>
augroup END
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
    autocmd BufNewFile,BufRead *.as set filetype=actionscript

    autocmd FileType actionscript map <C-Enter> :silent !test_movie.jsfl<cr>
    autocmd FileType actionscript map <S-C-Enter> :silent !publish_all.jsfl<cr>
augroup END

" }
" JAVASCRIPT {
augroup ft_javascript
    autocmd!

    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript set makeprg=jshint\ %
    autocmd FileType javascript set errorformat=%f:\ line\ %l,\ col\ %c,\ %m

    autocmd FileType javascript set nofoldenable

    autocmd filetype javascript noremap <buffer> <F1> :OpenURL https://developer.mozilla.org/en-US/search?q=<cword><CR>
    autocmd filetype javascript noremap! <buffer> <F1> :OpenURL https://developer.mozilla.org/en-US/search?q=<cword><CR>

    autocmd FileType javascript nnoremap gJ :OpenURL http://api.jquery.com/<cword><CR>
    autocmd FileType javascript nnoremap gB :OpenURL http://documentcloud.github.com/backbone/<CR>
    autocmd FileType javascript nnoremap g_ :OpenURL http://documentcloud.github.com/underscore/<CR>
augroup END
" }
" JSON {
augroup ft_json
    autocmd!

    autocmd BufNewFile,BufRead *.json set filetype=json syntax=javascript
augroup END
" }
" HTML {
augroup ft_html
    autocmd!

    autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html,xhtml set makeprg=tidy\ -quiet\ -errors\ %
    autocmd FileType html,xhtml set errorformat=line\ %l\ column\ %v\ -\ %m
    autocmd FileType html,xhtml set iskeyword+=-,_
    " autocmd FileType html,xhtml set makeprg="tidy --new-blocklevel-tags 'section, article, aside, hgroup, header, footer, nav, figure, figcaption' --new-inline-tags 'video, audio, embed, mark, progress, meter, time, ruby, rt, rp, canvas, command, details, datalist' --new-empty-tags 'wbr, keygen' -e ".shellescape(expand('%'))." 2>&1 \\| grep -v '\<table\> lacks \"summary\" attribute' \\| grep -v 'not approved by W3C'"

    " Fold the current tag.
    autocmd FileType html,xhtml nnoremap <buffer> <localleader>f Vatzf
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
" CSS {
augroup ft_css
    autocmd!

    autocmd FileType css set foldmethod=marker
    autocmd FileType css set foldmarker={,}
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType css set iskeyword+=-

    autocmd FileType css noremap <buffer> <F1> :OpenURL https://www.google.com/search?sitesearch=www.w3schools.com&amp;as_q=<cword><CR>
    autocmd FileType css noremap! <buffer> <F1> :OpenURL https://www.google.com/search?sitesearch=www.w3schools.com&amp;as_q=<cword><CR>

    autocmd BufNewFile,BufRead *.css nnoremap <buffer> <localleader>S viB<cr>:sort<cr>:noh<cr>
augroup END

let javascript_enable_domhtmlcss=1
" }
" JSFL {
augroup ft_jsfl
    autocmd!

    autocmd BufNewFile,BufRead *.jsfl set filetype=javascript
augroup END
"
" }
" VIMOUTLINER {
augroup ft_otl
    autocmd!

    autocmd BufRead,BufNewFile *.otl set filetype=vo_base
    autocmd BufRead,BufNewFile *.oln set filetype=xoutliner

    " Trigger an undo point after these characters.
    autocmd Filetype *.otl,*.oln inoremap . .<C-g>u
    autocmd Filetype *.otl,*.oln inoremap ! !<C-g>u
    autocmd Filetype *.otl,*.oln inoremap ? ?<C-g>u
    autocmd Filetype *.otl,*.oln inoremap : :<C-g>u
augroup END

" }
" TAGBAR {
" Manual add a tags file to the current directory, include subdirs as well.
nmap <leader><insert> :silent !ctags -aR *<cr>
set tags=tags;/ " Look up the directory for tags files.

let g:tagbar_usearrows=1
nnoremap <leader>t :TagbarToggle<cr>

" }
" GUNDO {
nnoremap <leader>g :GundoToggle<cr>
" }
" NETRW {
let g:netrw_liststyle=3                        " Show tree style listing.
let g:netrw_winsize=200                        " Width of the opened NETRW window.
let g:netrw_cygwin=0
let g:netrw_ignorenetrc=1                      " Do not ignore netrc.
" let g:netrw_fastbrowse    = 2
" let g:netrw_keepdir       = 0
" let g:netrw_retmap        = 1
" let g:netrw_silent        = 1
" let g:netrw_special_syntax= 1
" }
" RAGTAG {
let g:ragtag_global_maps=1 " Enable global mappings.

" }
" NERDTREE {
noremap <leader>n :NERDTreeToggle<cr> " Toggle the NERDTree side window.
noremap <leader>nf :NERDTreeFind<cr>  " Find the current file in NERDTree.
let NERDTreeHighlightCursorLine=1 " Highlight the cursorline.
let NERDTreeIgnore=[] " Ignore list.
let NERDTreeMinimalUI=1 " Minimal GUI for the NERDTree view.
let NERDTreeDirArrows=1 " Show little arrows in front of directories 
let NERDTreeHijackNetrw=1 " Use NERDTree instead of NetRW on 'e' and 'o'.
let NERDTreeChDirMode=2 " Change NERDTree listing when CWD changes.
" }
" SNIPMATE {
let g:snip_author='Pascal Immerzeel'
nnoremap <leader>es :vsplit ~/vimfiles/snippets/<cr>

" }
" CTRL-P {
let g:ctrlp_dont_split='NERD_tree_2'
let g:ctrlp_map='<leader>,'                             " Remap the default mapping.
let g:ctrlp_working_path_mode=0                         " Do not manage the root. Change manually.
let g:ctrlp_root_markers=['.settings', '.project']      " Custom markers for the root of the project.
let g:ctrlp_dotfiles=0                                  " Ignore dot files.
let g:ctrlp_mru_files=1                                 " Enable Most Recent Used files feature.
let g:ctrlp_jump_to_buffer=2                            " Jump to tab AND buffer if already open.

" }
" RAINBOW PARENTHESES {
nnoremap <leader>r :RainbowParenthesesToggle<cr>
let g:rbpt_max=16
" }
" ZENCODING {
let g:user_zen_leader_key="<c-e>"

" }
" YANKRING {
nnoremap <leader>y :YRShow<cr>
" }
" MATCHIT {
" Using the plugin distributed with VIM
runtime macros/matchit.vim

" }
" POWERLINE { 
" Allow fancy symbols in statusline.
" let g:Powerline_symbols = 'fancy'
" }
" CUSTOM REMAPS {

" Clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" }
" NON PUBLIC SETTINGS {
" so ~/_vimrc_private
" }
