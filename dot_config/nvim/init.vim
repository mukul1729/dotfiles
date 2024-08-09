set nocompatible              " be iMproved, required
filetype plugin on " required

filetype plugin indent on    " required

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'chriskempson/base16-vim'
Plug 'mbbill/undotree'
Plug 'sjl/gundo.vim'
Plug 'neovim/nvim-lspconfig' " Configuration for Nvim LSP
Plug 'preservim/nerdtree'
call plug#end()

set mousehide		" Hide the mouse when typing text
set backspace=indent,eol,start
set number relativenumber
set laststatus=2
set modifiable 
set guifont=Iosevka\ Regular\ 15
syntax on
colo base16-default-dark
let g:netrw_banner = 0
set tabstop=4
set textwidth=79
set hidden
set ignorecase
set ttimeoutlen=10
set autoindent
set lazyredraw
set nobackup
cd ~/Documents/computing
set shiftwidth=4
set synmaxcol=180
set termguicolors 
tnoremap <Esc> <C-\><C-n> 
set noswapfile
set nohlsearch
set foldmethod=indent
set foldlevel=99


set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %p%% 
set statusline+=\ %l:%c
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ 
set statusline+=\ 

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Abbreviations
iab map1 map(int, input().split())
iab list1 list(map(int, input().split()))
autocmd VimEnter * NERDTree | wincmd p

lua << EOF
-- Mappings.


require'lspconfig'.pyright.setup{}
