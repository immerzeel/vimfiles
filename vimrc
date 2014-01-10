" 1. Important {{{1
" =================
set nocompatible " Turn off Vi compatibility.
set pastetoggle=<F2> " Disable indenting when pasting from outside VIM.
set runtimepath+=~/.vim/bundle/vundle " Add Vundle to the runtime path.
set runtimepath+=~/.vim/snippets " Add Vundle to the runtime path.

filetype off " Required for Vundle.
call vundle#rc()

" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'

" File management / Search
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-abolish'
" Bundle 'majutsushi/tagbar'

" Colorscheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'
Bundle 'tpope/vim-vividchalk'

" Language syntax
Bundle 'tpope/vim-markdown'
" Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-haml'

" Text manipulation
Bundle 'VisIncr'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-smartinput'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

"SnipMate
" Bundle 'msanders/snipmate.vim'
Bundle "garbas/vim-snipmate"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/gist-vim'

" Unix
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-rsi'
Bundle 'tyru/open-browser.vim'

" JavaScript
Bundle 'marijnh/tern_for_vim'

" VimScript
Bundle 'kana/vim-vspec'
Bundle 'mattn/webapi-vim'
Bundle 'tpope/vim-scriptease'

" Objective-C
Bundle 'kiwi.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Match-Bracket-for-Objective-C'
Bundle 'b4winckler/vim-objc'
Bundle 'eraserhd/vim-ios'
" Bundle 'msanders/cocoa.vim'

filetype plugin indent on " Required
" 2. Moving around, searching and patterns {{{1
" =============================================
set nostartofline " Leave the cursor where it was.
set path+=./** " Search recursively down the current path.
set virtualedit=block " Allow the cursor on non-character positions.

set ignorecase " ignore case in search.
set wrapscan " Search from to the beginning of the file, when the end is reached.
set smartcase " when capitals are used, activate case-sensitive search automatically
set gdefault " Use global(g) option by default.

" Use sane regex in normal mode.
nnoremap / /\v
vnoremap / /\v

" Run yanked/selected regex.
vnoremap <leader>xr y/<c-r>0<cr>
nnoremap <leader>xr ^vg_y/<c-r>0<cr>

" Substitute
nnoremap <leader>s :%s//<left>
nnoremap <Leader>S :%s/<c-r><c-w><cr>//c<left><left>

" Use visual lines, not text object line.
noremap j gj
noremap k gk

" 3. Tags {{{1
" --==========
set tags=tags;/ " Look up the directory for tags files.

" Manual add a tags file to the current directory, include subdirs as well.
nnoremap <leader>ct :silent !ctags -aR *<cr>

" 4. Displaying text {{{1
" =======================
set fillchars="" " No characters in windows separators.
set nowrap " Do not wrap long lines.
set lazyredraw " Don't redraw while performing macros.
set list " Show tabs and end of lines as character.
set number " Show line numbers.

if has('win32')
    set guifont=Consolas:h12:cANSI " Set the GUI font.

    " Start maximize!
    autocmd GUIEnter * simalt ~ x
endif

if has('gui_macvim')
    set guifont=Inconsolata:h14 " Set the GUI font.
endif

" 5. Syntax, highlighting and spelling {{1
" ========================
set hlsearch " Highlight the search results.

set cursorline     " Highlight the line where the cursor is.
set colorcolumn=+1 " Highlight the 'textwidth' with a vertical line.

" 6. Multiple windows {{{1
" ========================
set statusline=%F\ %m\ %r\ %y\ %=%(Line:\ %l/%L\ [%p%%]\ Col:\ %c\ Buf:\ #%n%)\

set hidden " Allow changing from an unsaved buffer.

set splitright " Put the new window on the right on vertical split.
set splitbelow " Put the new windows on the bottor on horizontal split.

" Move around the windows faster!
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Split vertically.
noremap <leader>v <C-w>v

" Resize splits when the window is resized
autocmd VimResized * exe "normal! \<c-w>="

" 7. Multiple tab pages {{{1
" ==========================

" 8. Terminal {{{1
" ================
set shellslash " backslashes suck.
set ttyfast " Fast terminal connection. More characters. Smoother refresh.

" Change working directory to the current file path.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" 9. Using the mouse {{{1
" =======================
set mousehide " Hide the mouse cursor while typing.

" 10. Printing {{{1
" =================

" 11. Messages and info {{{1
" ==========================
set shortmess=atIA
"             |||
"             ||+ Disable intro screen.
"             |+ Truncate file message at the start if path doesn't fit.
"             + Collection of abbriviating methods.
set showmode " Show in which mode it is in.
set noerrorbells " no audible signal as well.
set visualbell t_vb= " Do not flash the screen when error occurs."{"}


set background=dark " background settings for solarized
let g:solarized_hitrail=1 " Correct the high contrast characters in the cursorline.
let g:solarized_termcolors=256
colorscheme solarized " Color scheme of VIM.

set guioptions=ace
"              |||
"              ||+ Use simple dialogs rather then popups
"              |+ Use GUI tabs, not console style tabs.
"              + Autoselect and yank the text to system clipboard.

set matchtime=5 " Blink the matching brace X times.

set cmdheight=2                " Set the command height under the statusline.

" 12. Selecting text {{{1
" =======================
if $TMUX == ''
    set clipboard=unnamed       " Cut/Copy in the OS will be P abled.
endif

" 13. Editing text {{{1
" =====================
set undofile
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload
set textwidth=80 " Set maximum line width.

set comments=sl:/**,mb:\ *,exl:\ */,sr:/*,mb:*,exl:*/,://

set formatoptions=croq                  " t
"                 ||||                    |
"                 ||||                    + Break text on textwidth.
"                 |||+ Let 'gq' format comments.
"                 ||+ Insert * when using 'O' or 'o' in Normal mode.
"                 |+ Insert * when typing <Enter> in Insert mode.
"                 + Break comment on textwidth.

" 14. Tabs and indenting {{{1
" ===========================
set tabstop=4 " Tab equals N space(bar)s.
set shiftwidth=4 " Number of spaces for an indent.
set expandtab " Convert tabs to spaces.
set smartindent " Use intelligent indentation for C
set cindent " Use C style indentation.

" 15. Folding {{{1
" ================
set foldenable " Turn folding on.
set foldmethod=marker " Fold on markers.

nnoremap <leader>z zMzvzz " Focus on the current fold.
nnoremap <space> za " Toggle folders open/close.

" 16. Diff {{{1
" =============

" 17. Mapping {{{1
" ================
let mapleader=','
let maplocalleader='\'

" Disable the help button, Apple's keyboard is hard enough.
nnoremap <F1> <nop>

" Clean whitespace
noremap <leader>W  :%s/\s\+$//<cr>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Make _vimrc easy accessible.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Steve Losh's highlight word setup.
highlight InterestingWord1 ctermfg=Black ctermbg=DarkRed
highlight InterestingWord2 ctermfg=Black ctermbg=White
highlight InterestingWord3 ctermfg=Black ctermbg=DarkBlue
nnoremap <leader>1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <leader>2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <leader>3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" 18. Reading and writing files {{{1
" ==================================
autocmd FocusLost * :wa " Save when losing focus.
set cryptmethod=blowfish " More secure method. Use vim -x {foobar}
set autoread " Refresh the buffer automatically after external file change.

" 19. The swap file {{{1
" ======================

" 20. Command line editing {{{1
" =============================
set wildmode=full              " List all matches and complete to the longest string.
set wildignore+=.git,.svn      " Ignore Version Control files and directories.

" Move on the commandline like in the shell.
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" 21. Executing external commands {{{1
" ====================================

" 22. Running make and jumping to errors
" ======================================

" 23. Language specific {{{1
" ==========================
" Vimrc {{{2
augroup ft_vimrc
    autocmd!

    " Source the vimrc file after saving it.
    autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" JavaScript {{{2
augroup ft_javascript
    autocmd!

    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal nofoldenable
augroup END

" JSON {{{2
augroup ft_json
    autocmd!

    autocmd BufNewFile,BufRead *.json setlocal filetype=json syntax=javascript
augroup END

" HTML {{{2
augroup ft_html
    autocmd!

    autocmd FileType html,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html,xhtml setlocal makeprg=tidy\ -quiet\ -errors\ %
    autocmd FileType html,xhtml setlocal errorformat=line\ %l\ column\ %v\ -\ %m
    autocmd FileType html,xhtml setlocal iskeyword+=-,_

    " Fold the current tag.
    autocmd FileType html,xhtml nnoremap <buffer> <localleader>f Vatzf
augroup END

" Markdown {{{2
augroup ft_markdown
    autocmd!

    autocmd BufNewFile,BufRead *.m*down setlocal filetype=markdown

    " Add headings.
    autocmd Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    autocmd Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    autocmd Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" CSS / SCSS {{{2
augroup ft_css
    autocmd!

    autocmd FileType css,scss setlocal foldmethod=marker
    autocmd FileType css,scss setlocal foldmarker={,}
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType css,scss setlocal iskeyword+=-

    autocmd BufNewFile,BufRead *.css,*.scss nnoremap <buffer> <localleader>S viB<cr>:sort<cr>:noh<cr>
augroup END

let javascript_enable_domhtmlcss=1

" Snippet {{{2
augroup ft_snippet
    autocmd!

    " Reload the snippets after saving.
    autocmd BufWritePost *.snippets :call ReloadAllSnippets()
augroup END

" C / C++ / Objective-C {{{2
augroup ft_objc
    autocmd!

    " Fix header types  seen as objcpp, breaks m/h switching.
    autocmd BufNewFile,BufRead *.h set filetype=objc

    " Add c and cpp also to the objc syntax highlighting.
    autocmd BufNewFile,BufRead *.cpp set filetype=objc
    autocmd BufNewFile,BufRead *.c set filetype=objc
augroup END

" 24. multi-byte characters {{{1
" ==========================

" 25. Various {{{1
" ================
" Tern for Vim {{{2
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" SnipMate {{{2
let g:snip_author='Pascal Immerzeel'

" Easy access to filetype snippet file.
nnoremap <leader>es :execute 'vs $HOME/.vim/snippets/'.&filetype.'.snippets'<cr>
nnoremap <leader>esd :execute 'vs $HOME/.vim/snippets/'<cr>

" Tagbar {{{4
" let g:tagbar_usearrows=1
" nnoremap <leader>t :TagbarToggle<cr>

" let tlist_objc_settings    = 'objc;i:interface;c:class;m:method;p:property'
" Netrw {{{2
let g:netrw_liststyle=3                        " Show tree style listing.
let g:netrw_winsize=200                        " Width of the opened NETRW window.
let g:netrw_altv=1                             " Open new window vertically to the right.
let g:netrw_rsync_cmd="rsync -Raze"            " Extra options for rsyc.

" Nerdtree {{{2
noremap <leader>n  :NERDTreeToggle<cr>
noremap <leader>nf :NERDTreeFind<cr>

" Ragtag {{{2
let g:ragtag_global_maps=1 " Enable global mappings.

" Gist {{{2
let g:gist_clip_command='pbcopy'
let g:gist_open_browser_after_post=1
let g:gist_detect_filetype=1

" }}}
" Clang complete {{{2
let g:clang_auto=1
let g:clang_use_library=1
let g:clang_periodic_quickfix=1
let g:clang_close_preview=1

let g:clang_snippets=1
let g:clang_snippets='snipmate'
let g:clang_auto_user_options='path, .clang_complete'
" let g:clang_exec='/usr/local/bin/clang'
" let g:clang_library_path='/usr/local/lib/libclang.dylib'

" }}}
" so ~/_vimrc_private
"
" If an .exrc exists, source it.
if filereadable(".exrc")
    echom "Local .exrc loaded."
    source .exrc
endif
