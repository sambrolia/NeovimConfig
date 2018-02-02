let mapleader = "\<Space>"
set nocompatible
filetype off

let g:python_host_prog='C:\Program Files\Python31'

" ============= Plugins ==================== }}}

" Specify a directory for plugins
call plug#begin('Neovim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
"}}}

" ============= General Config ================ {{{

set relativenumber                                                              "Show numbers relative to current line
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=split                                                            "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set mouse=a 

" map system clipboard to leader yank and paste
nmap     <leader>y "+y
vmap     <leader>y "+y
nmap     <leader>p "+p
vmap     <leader>p "+p

" leader shortcuts for NERDTree
map <leader>t :NERDTree<CR>

syntax on                                                                       "turn on syntax highlighting
silent! colorscheme onedark

" }}}
" ================ Indentation ====================== {{{

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set nofoldenable

" }}}
" ================ Turn Off Swap Files ============== {{{

set noswapfile
set nobackup
set nowb
"}}}

" ================ Persistent Undo ================== {{{

" Keep undo history across sessions, by storing in file.
silent !mkdir C:/nvim/backups > /dev/null 2>&1
set undodir=C:/nvim/backups
set undofile
"}}}

" ================ Auto commands ====================== {{{

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call StripTrailingWhitespaces()                    "Auto-remove trailing spaces
autocmd vimrc InsertEnter * :set nocul                                          "Remove cursorline highlight
autocmd vimrc FocusGained,BufEnter * checktime                                  "Refresh file when vim gets focus

"}}}

" ================ Search setup ================ {{{
nmap     <leader>ff <Plug>CtrlSFPrompt
vmap     <leader>ff <Plug>CtrlSFVwordPath
vmap     <leader>fF <Plug>CtrlSFVwordExec
nmap     <leader>fn <Plug>CtrlSFCwordPath
nmap     <leader>fp <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>
inoremap <leader>ft <Esc>:CtrlSFToggle<CR>

"}}}

" ================ ctrl P ================ {{{
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"}}}

" ================ Colorscheme setup ================ {{{
autocmd vimrc FileType php setlocal sw=4 sts=4 ts=4                             "Set indentation to 4 for php

let g:bold_highlight_groups = ['Function', 'Statement', 'Todo', 'CursorLineNr', 'MatchParen', 'StatusLine']

for group in g:bold_highlight_groups
  call onedark#extend_highlight(group, { 'gui': 'bold' })
endfor
"}}}
