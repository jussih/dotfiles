" ========== Vim Basic Settings ============="

" basic settings
scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set nocompatible
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
let mapleader = " "

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

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%{HasPaste()}         "paste flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines

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
nnoremap <F3> :Vexplore<cr>
inoremap <F3> :Vexplore<cr>

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
    colorscheme catppuccin
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

""" Local Specific Configuration
" Use local vimrc if available
if filereadable(expand("\~/.vimrc.local"))
  source \~/.vimrc.local
endif
