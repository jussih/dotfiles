" ========== Vim Basic Settings ============="

" Pathogen settings.
set nocompatible
filetype off

" First time install
let VundleExists=0
let vundle_readme=expand($HOME.'/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let VundleExists=1
endif

" Run :PluginInstall if plugins are not autoinstalled
if has('vim_starting')
  set rtp+=~/.vim/bundle/Vundle.vim
endif

" Vundle + Plugins
call vundle#begin()
" List plugins here
Plugin 'airblade/vim-gitgutter'
Plugin 'gmarik/Vundle.vim.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
"Plugin 'godlygeek/tabular'
"Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
let g:grepper = {}
Plugin 'mhinz/vim-grepper'
Plugin 'lepture/vim-jinja'
"Plugin 'ludovicchabant/vim-lawrencium'
"Plugin 'majutsushi/tagbar'
"Plugin 'maxmeyer/vim-taskjuggler'
Plugin 'sjl/badwolf'
Plugin 'PotatoesMaster/i3-vim-syntax'
"Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'Raimondi/delimitMate'
"Plugin 'rodjek/vim-puppet'
"Plugin 'markcornick/vim-vagrant'
"Plugin 'saltstack/salt-vim'
"Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
"Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'vimez/vim-tmux'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
"Plugin 'edkolev/tmuxline.vim'
"Plugin 'evanmiller/nginx-vim-syntax'
"Plugin 'voikko/corevoikko', {'rtp': 'tools/vim'}
Plugin 'othree/html5.vim'
"Plugin 'mattn/emmet-vim'
"Plugin 'gregsexton/MatchTag'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'elixir-lang/vim-elixir'
Plugin 'w0rp/ale'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'epilande/vim-react-snippets'
call vundle#end()

filetype plugin indent on


if VundleExists == 1
    echo "Installing Plugins"
    echo ""
    :PluginInstall
endif

" basic settings
scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
"set visualbell                 " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
"set autoread                   " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=block           " visual block mode can move where there is no actual character
set splitright                  " open splits on the right side
set splitbelow                  " open vertical splits below
set mouse=a                     " support mouse
set complete-=i
set cmdheight=1
set shortmess=atI               " don't show intro message when starting

" search
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters
nnoremap / /\v
vnoremap / /\v
set gdefault

" Indenting settings.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent

set scrolloff=3
set showmode
syntax on

set laststatus=2

" history and undo
set history=1000
set undofile
set undoreload=1000

"set relativenumber
set number
set norelativenumber

set matchtime=3

" Leader Key mappings
" Changing Leader Key
let mapleader = ","

" open split
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" system clipboard
map <Leader>y "*y
map <Leader>p "+p

" ,W Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
"nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
"nnoremap <leader>q gqip

" ,v Select just pasted text.
nnoremap <leader>v V`]

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" ,w save current file
nnoremap <leader>w <ESC>:w<cr>

"clear highlights
nnoremap <leader><space> :noh<cr>


"remapping tab causes CTRL-I to not work for moving forward in the jumplist
"nnoremap <tab> %
"vnoremap <tab> %

" Toggle to disable autoindent
set pastetoggle=<F4>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE '
    en
    return ''
endfunction

hi User1 guifg=#eea040 guibg=#222922 ctermbg=17
hi User2 guifg=#dd3333 guibg=#222922 ctermbg=17
hi User3 guifg=#ff66ff guibg=#222922 ctermbg=17
hi User4 guifg=#a0ee40 guibg=#222922 ctermbg=17
hi User5 guifg=#eeee40 guibg=#222922 ctermbg=17

"statusline managed by airline
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%{HasPaste()}         "paste flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines

" backups
function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make dirs if they do not exist
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)
set backupskip=/tmp/*,/private/tmp/*"

" Make Vim handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=81

" display whitespace characters
set list
set listchars=tab:▸\ ,eol:¬,nbsp:␣,trail:•

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; in command mode.
nnoremap ; :

" Home key moves to beginning of text instead of column 0
inoremap <home> <c-o>^

" Resize split when the window is resized
au VimResized * :wincmd =

" Wildmenu completion "
set path+=** " Enable full recursive search
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX"
set wildignore+=*.luac "Lua byte code"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.egg/** "Ignore files inside python egg libs"
set wildignore+=**/node_modules/** "NPM packages"

" imitate nerdtree with netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide='.*\.swp$,.*\.pyc$'
"nnoremap <F3> :Vexplore<cr>
"inoremap <F3> :Vexplore<cr>

" Make Sure that Vim returns to the same line when we reopen a file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

"File types
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .ino files as .cpp
autocmd BufNewFile,BufRead *.ino setfiletype arduino syntax=cpp
" i3 config
autocmd BufEnter *i3/config setlocal filetype=i3
autocmd FileType python set ft=python.django " consider all python as django for snipmate

" templates
augroup templates
  autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
  autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
augroup END

" Move lines
nnoremap <C-S-down> :m .+1<CR>==
nnoremap <C-S-up> :m .-2<CR>==
inoremap <C-S-down> <Esc>:m .+1<CR>==gi
inoremap <C-S-up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-down> :m '>+1<CR>gv=gv
vnoremap <C-S-up> :m '<-2<CR>gv=gv

" fast window movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quoting
"   single quote word
nnoremap qw :silent! normal "zyiw<Esc>:let @z="'".@z."'"<CR>cw<c-r>z<Esc>b
"   double quote word
nnoremap qd :silent! normal "zyiw<Esc>:let @z="\"".@z."\""<CR>cw<c-r>z<Esc>b
"   single and double quote visual selection
vmap <silent> qw :call Quote("'")<CR>
vmap <silent> qd :call Quote('"')<CR>
function! Quote(quote)
  let save = @"
  silent normal gvy
  let @" = a:quote . @" . a:quote
  silent normal gvp
  let @" = save
endfunction

" =========== END Basic Vim Settings ===========

" =========== Gvim Settings =============

if has("gui_running")
    "set guitablabel=%-0.12t%M
    set guioptions-=T "toolbar off
    set guioptions+=r "scrollbars enabled
    set guioptions-=L "disable left scrollbar
    set guioptions+=a
    set guioptions-=m "menu disabled
    set guioptions-=t "menu disabled
    set guioptions-=g "menu disabled
    set background=dark
    colorscheme solarized
    if has("gui_gtk2")
      "https://github.com/powerline/fonts
      set guifont=Inconsolata\ 12
    elseif has("gui_gtk3")
      "https://github.com/powerline/fonts
      set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
      set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
      set guifont=Consolas:h11:cANSI
    endif
else
    "set t_Co=256
    set background=dark
    colorscheme badwolf
    "fix ctrl-arrow keys with putty
    map <ESC>[D <C-Left>
    map <ESC>[C <C-Right>
    map <ESC>[A <C-Up>
    map <ESC>[B <C-Down>
    map! <ESC>[D <C-Left>
    map! <ESC>[C <C-Right>
    map! <ESC>[A <C-Up>
    map! <ESC>[B <C-Down>
    let g:airline_powerline_fonts=0
    let g:airline_right_sep=''
    let g:airline_right_alt_sep='|'
    let g:airline_left_sep=''
    let g:airline_left_alt_sep='|'

endif


" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="

" ALE
let g:ale_lint_delay = 1000
let g:ale_linters = {'python': ['flake8', 'pylint']}

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'w'
"noremap <c-b> :CtrlPBuffer<cr>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
  " Use Rg over Ag and Grep
  set grepprg=rg\ --no-heading\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" NERDTree
nnoremap <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeChDirMode = 2

" SuperTab
"let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" airline
set noshowmode
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_z = '%l/%L' "lines / totalLines
let g:airline#extensions#ale#enabled = 1

" Jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#show_call_signatures = 0 "sometimes buggy
let g:jedi#popup_on_dot = 0

"" Syntastic 
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_cursor_column = 1
"let g:syntastic_python_flake8_args="--ignore=E111,E121,E501,W391"
"let g:syntastic_enable_highlighting = 1
"nnoremap <F11> :w<cr>:SyntasticCheck<cr>:Errors<cr>
"inoremap <F11> <ESC>:w<cr>:SyntasticCheck<cr>:Errors<cr>

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ultisnips_python_style = "sphinx"
let g:UltiSnipsEditSplit = "vertical"

" indentline
" disable globally. Enable only on some files
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
"let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_fileType = ['python', 'puppet', 'sls', 'html', 'js']
nmap <F6> :IndentLinesToggle<CR>
imap <F6> <ESC>:IndentLinesToggle<CR>i

" vim-grepper 
nmap <Leader>a :Grepper<cr>
let g:grepper.tools = ['rg', 'ag', 'ack', 'git', 'grep']
let g:grepper.ag = {
    \ 'grepprg':    'ag --ignore eggs/ --ignore coverage/ --ignore staticroot/ -U -i',
    \ 'grepformat': '%f:%l:%m',
    \ 'escape':     '\^$.*[]',
    \ }
let g:grepper.rg = {
    \ 'grepprg':    'rg -g "!{eggs,coverage,staticroot}/*" -g "!{.git,.hg,.node-modules}/*" --no-ignore --vimgrep -S',
    \ 'grepformat': '%f:%l:%m',
    \ 'escape':     '\^$.*[]',
    \ }

"
" =========== END Plugin Settings =========="
"


""" Local Specific Configuration
" Use local vimrc if available
if filereadable(expand("\~/.vimrc.local"))
  source \~/.vimrc.local
endif
