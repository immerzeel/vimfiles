" 1. Important {{{1
" =================
set nocompatible " Turn off Vi compatibility.
set pastetoggle=<F2> " Disable indenting when pasting from outside VIM.
set runtimepath+=/usr/local/opt/fzf " Add FZF path.


" Load plugins
set runtimepath+=~/.vim/bundle/Vundle.vim " Add Vundle plugin manager
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-dispatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-criticmarkup'
Plugin 'godlygeek/tabular'
Plugin 'kana/vim-smartinput'
Plugin 'junegunn/fzf.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'davidoc/taskpaper.vim'

call vundle#end()
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
set showbreak=↪\ 
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set number " Show line numbers.
set encoding=utf-8 " Render special symbols correctly

" 5. Syntax, highlighting and spelling {{{1
" ========================
set hlsearch " Highlight the search results.

set cursorline     " Highlight the line where the cursor is.
set colorcolumn=+1 " Highlight the 'textwidth' with a vertical line.
set spellfile=~/.nl.add " Add words to the spelling file.

" 6. Multiple windows {{{1
" ========================
set statusline=%F\ %m\ %r\ %y\ %{fugitive#statusline()}%=%(Line:\ %l/%L\ [%p%%]\ Col:\ %c\ Buf:\ #%n%)\

set hidden " Allow changing from an unsaved buffer.

set splitright " Put the new window on the right on vertical split.
set splitbelow " Put the new windows on the bottor on horizontal split.

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
set visualbell t_vb= " Do not flash the screen when error occurs.

" background settings for solarized
let g:solarized_hitrail=1 " Correct the high contrast characters in the cursorline.
colorscheme solarized " Color scheme of VIM. Suppress errors with `silent!`
call togglebg#map("<F5>") " Toggle `light` and `dark` colorscheme with one button.

set guioptions=ace
"              |||
"              ||+ Use simple dialogs rather then popups
"              |+ Use GUI tabs, not console style tabs.
"              + Autoselect and yank the text to system clipboard.

set matchtime=5 " Blink the matching brace X times.

set cmdheight=2 " Set the command height under the statusline.

" 12. Selecting text {{{1
" =======================
" Use `+y` to yank the text to the system clipboard. This prevents polluting clipboard

" set clipboard=unnamed       " Cut/Copy in the OS will be enabled.


" 13. Editing text {{{1
" =====================
set undofile
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload
set textwidth=72 " Set maximum line width.

set comments=sl:/**,mb:\ *,exl:\ */,sr:/*,mb:*,exl:*/,://

set formatoptions=croq " t
"                 ||||   |
"                 ||||   + Break text on textwidth.
"                 |||+ Let 'gq' format comments.
"                 ||+ Insert * when using 'O' or 'o' in Normal mode.
"                 |+ Insert * when typing <Enter> in Insert mode.
"                 + Break comment on textwidth.

" 14. Tabs and indenting {{{1
" ===========================
" Indenting is handled by vim-sleuth plugin.

" 15. Folding {{{1
" ================
set foldenable " Turn folding on.
set foldmethod=marker " Fold on markers.

" Focus on the current fold.
nnoremap <leader>z zMzvzz
" Toggle folders open/close.
nnoremap <space>z za

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

" 18. Reading and writing files {{{1
" ==================================
autocmd FocusLost * :wa " Save when losing focus.
set cryptmethod=blowfish " More secure method. Use vim -x {foobar}
set autoread " Refresh the buffer automatically after external file change.

" 19. The swap file {{{1
" ======================
set dir=/tmp//

" 20. Command line editing {{{1
" =============================
set wildmode=full       " List all matches and complete to the longest string.
set wildignore+=.git    " Ignore Version Control files and directories.

" 21. Executing external commands {{{1
" ====================================

" 22. Running make and jumping to errors {{{1
" ===========================================

" 23. Language specific {{{1
" ==========================
" Quickfix {{{2
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd VimEnter        *     cwindow
augroup END

" Vimrc {{{2
augroup ft_vimrc
    autocmd!

    " Source the vimrc file after saving it.
    autocmd BufWritePost *.vimrc source $MYVIMRC
augroup END

" JavaScript {{{2
augroup ft_javascript
    autocmd!

    autocmd FileType javascript,js setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript,js setlocal nofoldenable

    autocmd FileType javascript,js setlocal makeprg=eslint
    autocmd FileType javascript,js setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma
    autocmd BufWritePost *.js silent make | silent redraw!
augroup END

" JSON {{{2
augroup ft_json
    autocmd!

    autocmd FileType json setlocal makeprg=jsonlint
    autocmd BufWritePost json silent make | silent redraw!

    autocmd BufNewFile,BufRead *.json setlocal filetype=json syntax=javascript
augroup END

" HTML {{{2
augroup ft_html
    autocmd!

    autocmd FileType html,mustache setlocal iskeyword+=-,_

    autocmd FileType html,mustache setlocal makeprg=tidy
    autocmd BufWritePost *.html,*.mustache silent make % | silent redraw!

    " Fold the current tag.
    autocmd FileType *.html,*.mustache nnoremap <buffer> <localleader>f Vatzf
augroup END

" Dockerfile {{{2
augroup ft_dockerfile
    autocmd!

    autocmd FileType dockerfile setlocal makeprg=hadolint
    autocmd BufWritePost dockerfile silent make % | silent redraw!
augroup END

" Ansible {{{2
augroup ft_ansible
    autocmd!
    autocmd BufNewFile,BufRead *.yaml,*.yml,*/{group,host}_vars/* setlocal filetype=ansible syntax=yaml

    autocmd FileType yaml,yml setlocal makeprg=ansible-lint
    autocmd BufWritePost *.yaml,*.yml silent make % | silent redraw!
augroup END

" YAML {{{2
augroup ft_yaml
    autocmd!

    autocmd FileType yaml,yml setlocal makeprg=yamllint
    autocmd BufWritePost *.yaml,*.yml silent make % | silent redraw!
augroup END

" Markdown {{{2
augroup ft_markdown
    autocmd!

    autocmd BufNewFile,BufRead *.markdown,*.md, setlocal spell spelllang=nl

    autocmd FileType markdown,md setlocal makeprg=proselint
    autocmd BufWritePost *.markdown,*.md silent make "%" | silent redraw!
augroup END

" Taskpaper {{{2
augroup ft_taskpaper
    autocmd!

    autocmd BufNewFile,BufRead *.taskpaper setlocal spell spelllang=nl
augroup END

" CSS / SCSS {{{2
augroup ft_css
    autocmd!

    autocmd FileType *.css,*.scss setlocal foldmethod=marker
    autocmd FileType *.css,*.scss setlocal foldmarker={,}

    autocmd BufNewFile,BufRead *.css,*.scss nnoremap <buffer> <localleader>S viB<cr>:sort -i -b<cr>:noh<cr>
augroup END

" Snippet {{{2
augroup ft_snippet
    autocmd!

    " Reload the snippets after saving.
    autocmd BufWritePost *.snippets :call ReloadAllSnippets()
augroup END

" 24. multi-byte characters {{{1
" ==========================

" 25. Various {{{1
" ================

" Netrw {{{2
let g:netrw_banner=0                           " Hide the info banner.
let g:netrw_liststyle=3                        " Show tree style listing.
let g:netrw_keepdir=1                          " Keep current dir immune from browsing
let g:netrw_preview=1                          " Preview vertically.

" Taskpaper {{{2
let g:task_paper_date_format = "%d-%m-%Y"
let g:task_paper_styles={'waiting-for': 'ctermfg=DarkMagenta',
                        \'cancelled': 'ctermfg=Black',
                        \ 'start': 'ctermfg=Green',
                        \ 'due': 'ctermfg=Red'}
nnoremap <buffer> <silent> <leader>t> :<c-u>call taskpaper#update_tag('start')<cr>
nnoremap <buffer> <silent> <leader>t< :<c-u>call taskpaper#update_tag('due')<cr>
nnoremap <buffer> <silent> <leader>t! :<c-u>call taskpaper#update_tag('priority')<cr>
nnoremap <buffer> <silent> <leader>t8 :<c-u>call taskpaper#toggle_tag('waiting-for', '')<cr>
" Ultisnips {{{2
let g:UltiSnipsListSnippets="<c-L>"
let g:UltiSnipsSnippetDirectories=$HOME.'/.vim/UltiSnips'

" FZF {{{2
" current file directory
nnoremap <space>- :FZF <c-r>=fnameescape(expand('%:p:h'))<cr>/<cr>

" current working directory
nnoremap <space>+ :FZF<cr>

nnoremap <space>fb :Buffers<cr>
nnoremap <space>f/ :History/<cr>
nnoremap <space>f: :History:<cr>
nnoremap <space>fc :Commits<cr>
nnoremap <space>ff :FZF<space>
nnoremap <space>fg :GFiles<cr>
nnoremap <space>fl :Lines<cr>
nnoremap <space>fm :Marks<cr>
nnoremap <space>fr :History<cr>
nnoremap <space>fs :Ag<space>
nnoremap <space><space> :Commands<cr>

" }}}
