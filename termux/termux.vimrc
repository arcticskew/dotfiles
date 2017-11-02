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

" fancy listchars
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

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
map <leader>d :silent !mupdf %<.pdf<CR>
map <leader>r :silent !./%<CR>

" spelling shortcuts
map <silent> <leader>ss :setlocal spell!<CR>
map <silent> <leader>sn ]s
map <silent> <leader>sp [s
map <silent> <leader>sa zg
map <silent> <leader>s? z=

" buffer shortcuts
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>
nmap <leader>q :bprev <BAR> bd #<CR>
nmap <leader>o :Bonly<CR>
nmap <C-t> :enew<CR>
imap <C-t> <Esc>:enew<CR>

" four space tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" spellcheck markdown and gitcommit
au FileType markdown setlocal spell spelllang=en_us
au FileType gitcommit setlocal spell spelllang=en_us

" highlight long lines
au BufWinEnter *.c,*.h let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
