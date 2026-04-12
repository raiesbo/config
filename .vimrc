" ============================================================
"  .vimrc — Neovim-like experience
" ============================================================

" ── Core ────────────────────────────────────────────────────
set nocompatible              " Ditch Vi compatibility
filetype plugin indent on     " Enable filetype detection + plugins
syntax enable                 " Syntax highlighting

" ── Appearance ──────────────────────────────────────────────
set termguicolors             " 24-bit true color (requires terminal support)
set background=dark
set number                    " Absolute line numbers
set relativenumber            " Relative line numbers (hybrid mode)
set cursorline                " Highlight the current line
set signcolumn=yes            " Always show sign column (no layout shifts)
set colorcolumn=80,120        " Ruler columns
set laststatus=2              " Always show statusline
set showcmd                   " Show partial commands in statusline
set showmode                  " Show current mode
set ruler                     " Show cursor position
set scrolloff=8               " Keep 8 lines visible above/below cursor
set sidescrolloff=8           " Keep 8 cols visible left/right

" ── Color Scheme ────────────────────────────────────────────
" Uses ~/.vim/colors/nightshift-fallback.vim
colorscheme nightshift-fallback

" ── Indentation ─────────────────────────────────────────────
set expandtab                 " Spaces instead of tabs
set tabstop=4                 " Visual width of a tab
set shiftwidth=4              " Indent size for >> / <<
set softtabstop=4             " Tab in insert mode
set smartindent               " Auto-indent new lines
set autoindent
set shiftround                " Round indents to shiftwidth multiples

" ── Search ──────────────────────────────────────────────────
set incsearch                 " Live search as you type
set hlsearch                  " Highlight all matches
set ignorecase                " Case-insensitive search
set smartcase                 " Unless pattern has uppercase
set wrapscan                  " Wrap search around file

" Clear search highlight
nnoremap <Esc> :nohlsearch<CR><Esc>
nnoremap <leader>/ :nohlsearch<CR>

" ── Files & Buffers ─────────────────────────────────────────
set hidden                    " Allow unsaved buffers in background
set autoread                  " Reload file if changed outside Vim
set noswapfile                " No .swp files
set nobackup                  " No backup~ files
set undofile                  " Persistent undo across sessions
set undodir=~/.vim/undodir    " Where to store undo files
silent! call mkdir(expand('~/.vim/undodir'), 'p')

" ── Performance ─────────────────────────────────────────────
set lazyredraw                " Don't redraw during macros
set ttyfast                   " Fast terminal connection
set updatetime=300            " Faster CursorHold / swap write
set timeoutlen=1000           " Key sequence timeout (1s, safe for yy/dd/cc)

" ── Splits & Windows ────────────────────────────────────────
set splitright                " New vertical splits open to the right
set splitbelow                " New horizontal splits open below

" ── Completion ──────────────────────────────────────────────
set wildmenu                  " Command-line completion menu
set wildmode=longest:full,full
set wildignore=*.o,*.pyc,*.class,node_modules/**,.git/**
set completeopt=menuone,noinsert,noselect
set shortmess+=c              " Suppress completion messages

" ── Display ─────────────────────────────────────────────────
set wrap                      " Wrap long lines visually
set linebreak                 " Break at word boundaries
set breakindent               " Indent wrapped lines
set list                      " Show invisible characters
set listchars=tab:>\ ,trail:.,nbsp:_,extends:>,precedes:<
set showmatch                 " Briefly jump to matching bracket
set matchtime=2               " How long (tenths of a second)
set noerrorbells              " No bell on errors
set visualbell t_vb=          " No visual flash either

" ── Encoding ────────────────────────────────────────────────
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" ── Folding ─────────────────────────────────────────────────
set foldmethod=indent         " Fold by indentation
set foldlevelstart=99         " Open all folds by default
set foldenable

" ── Clipboard ───────────────────────────────────────────────
"if has('clipboard')
"  set clipboard=unnamedplus   " Use system clipboard (Linux / WSL)
"endif

" ── Key Mappings ────────────────────────────────────────────
let mapleader = " "           " Space as leader (nvim default feel)

" Fast save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits with leader keys
nnoremap <leader>+ :resize +2<CR>
nnoremap <leader>- :resize -2<CR>
nnoremap <leader>< :vertical resize -2<CR>
nnoremap <leader>> :vertical resize +2<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bl :ls<CR>

" Move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centred when jumping
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Indent and stay in visual mode
vnoremap < <gv
vnoremap > >gv


" Toggle file explorer (netrw)
nnoremap <leader>e :Lexplore<CR>

" ── Netrw (built-in file explorer) ──────────────────────────
let g:netrw_banner    = 0     " Hide the banner
let g:netrw_liststyle = 3     " Tree view
let g:netrw_winsize   = 25    " 25% width

" ── Statusline (no plugin needed) ───────────────────────────
function! GitBranch()
  let branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return len(branch) > 0 ? ' ' . branch . ' ' : ''
endfunction

set statusline=
set statusline+=%#PmenuSel#%{GitBranch()}
set statusline+=%#StatusLine#\ %f
set statusline+=\ %m%r
set statusline+=%=
set statusline+=%#Comment#\ %y
set statusline+=\ %{&fileencoding}
set statusline+=\ %l:%c
set statusline+=\ %p%%\

" ── Auto-commands ────────────────────────────────────────────
augroup productivity
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" ── Language-specific indentation ────────────────────────────
augroup filetypes
  autocmd!
  autocmd FileType javascript,typescript,json,yaml,html,css,scss,vue
    \ setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType go
    \ setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType markdown
    \ setlocal wrap linebreak spell spelllang=en_us
augroup END

