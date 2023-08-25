" Behaviour
let g:is_posix = 1              " Assume posix compatible shell
set autochdir                   " Change working directory to open buffer
set backspace=indent,eol,start  " Backspace over anything in insert mode
set encoding=utf-8              " Set Default encoding
set nocompatible                " Welcome to the present (don't need vi compatibility)
set noerrorbells                " Don't annoy me when I hit the end of the file
set noswapfile                  " Don't create a lock file for open files
set ttimeout ttimeoutlen=0      " Remove delay from mode update
set hidden                      " Hide inactive buffers

" Filetype specific settings
filetype plugin on
filetype indent on

" History
set history=1000                " Command history size
set undolevels=2000             " Number of undo levels

" Visual
colorscheme slate               " Set theme to an almost dark one
set laststatus=2                " Show statusline always
set ruler                       " Show row and column ruler information
set wildmenu                    " Display all matches in command bar and navigate them
set showmatch                   " Highlight matching brace
set showmode                    " Show current mode down the bottom

" Show tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Statusline
set statusline=
set statusline+=%0*\[%n]                            " buffernr
set statusline+=\ %<%F\                             " File+path
set statusline+=%1*\ %m%r%w                         " Modified? Readonly?
set statusline+=%=%y\                               " FileType 
set statusline+=%{(&bomb?\",BOM\":\"\")}            " Encoding
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}\  " Encoding
set statusline+=\ %{&ff}\ \                         " FileFormat (dos/unix..)
set statusline+=%0*\ \%l/%L                         " Row number / total rows
set statusline+=\ %3v\                              " Column number

" Force syntax highlighting when colors are supported
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

" Search
set nohlsearch                  " Don't highlight all search results
set incsearch                   " Searches for strings incrementally
set ignorecase                  " Case insensitive searches
set smartcase                   " ^ Unless search contains an upper case character

" Lines & Gutters
set cursorline                  " Highlight current line
set linebreak                   " Wrap lines at convenient points
set breakindent                 " Wrap lines without breaking indents
set number                      " Show line numbers
set relativenumber              " Use relative line numbers
set scrolloff=8                 " Always show lines before and after line position

" Indents
set autoindent                  " Auto-indent new lines
set expandtab                   " Use spaces instead of tabs
set shiftwidth=4                " Number of auto-indent spaces
set softtabstop=4               " Number of spaces per Tab
set smartindent                 " Enable smart-indent
set smarttab                    " Enable smart-tabs

" Stop comments from triggering indentation
set cindent
set cinkeys-=0#
set indentkeys-=0#
autocmd FileType * set cindent
autocmd FileType * setlocal indentkeys-=0#

" Completion options
set completeopt=noinsert,menuone,noselect

" Keymaps
let mapleader="\\"              " Set leader key as backslash
set timeoutlen=500              " Set timeout length to 500ms for leader combos

" Search & Replace
nmap <C-h> :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
vmap <C-h> y<ESC>:%s@\V<C-r>0@@gI<Left><Left><Left>

" Moving
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv

" Move Selection
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" Buffers
nmap <C-PageDown> :bnext<CR>
nmap <C-PageUp> :bprevious<CR>
nmap <Leader>q :bdelete<CR>
nmap <Leader>Q :bdelete!<CR>

" Open FileExplorer to the left at 50 cols wide
nmap <F3> :Lexplore<CR>:vertical resize 50<CR>

" Don't accidentally quit
imap <C-c> <Esc>

" Disable shift-q
nmap Q <nop>
