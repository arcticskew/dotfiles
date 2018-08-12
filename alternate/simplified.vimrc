" turn off compability mode
set nocp

" set how highlights are displayed
hi Normal guibg=black guifg=white
hi clear SpellBad
hi SpellBad cterm=bold ctermfg=red

" highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" main settings
set laststatus=2        " always have status line
set encoding=utf-8      " using UTF-8 terminal
set nobackup            " backups suck
set nowritebackup       " seriously
set history=50          " keep 50 lines of command line history
set ruler               " always show ruler
set showcmd             " show incomplete commands
set vb                  " visual bell
set hidden              " hide buffers when abandoned
set scrolloff=2         " two lines of context
set autoread            " autoread when file changes
set nohlsearch          " do not highlight search terms by default
set spellsuggest=5      " offer five spelling suggestions

" wild options
set wildmode=longest,list,full
set wildmenu
set wildignorecase
set wildignore+=*.o,*.zip,*.pyc

" fancy listchars
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" backspace in visual mode deletes selection
vnoremap <BS> d

" tab character
inoremap <S-Tab> <C-V><Tab>

" enable syntax highlighting
syntax enable

" abbreviations
iabbrev teh the
iabbrev #i #include
cabbrev W w
nnoremap ; :

" blank line shortcuts
nmap N O<Esc>
nmap n o<Esc>

" set lead character for shortcuts
let mapleader = ","

" general shortcuts
map <silent> <leader>sl :set list!<CR>

" vimrc shortcuts
map <leader>ev :e ~/.vimrc<CR>
map <leader>sv :source ~/.vimrc<CR>

" clipboard shortcuts
nmap <leader>y "+yy
vmap <leader>y "+y
map <leader>P "+p
map <silent> <leader>so :set paste!<CR>

" split window shortcuts
map <space>w <c-w><c-w>
map <leader>w <c-w><c-w>
map <space><space> <c-W>_
map <space>= <c-W>=
map <space>r <c-W>r
map <space>o <c-W>o
if bufwinnr(1)
    map + <c-W>+
    map - <c-W>-
endif

" buffer shortcuts
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>
nmap <leader>q :bprev <BAR> bd #<CR>
nmap <leader>o :Bonly<CR>
nmap <C-t> :enew<CR>
imap <C-t> <Esc>:enew<CR>

" four space tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" set file types of unknown extensions
au BufRead,BufNewFile,BufEnter *.pde setfiletype cpp
au BufRead,BufNewFile,BufEnter *.json setfiletype javascript

" spellcheck markdown and gitcommit
au FileType markdown setlocal spell spelllang=en_us
au FileType gitcommit setlocal spell spelllang=en_us

if version >= 600
  filetype plugin indent on
endif
