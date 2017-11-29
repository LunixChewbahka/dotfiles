call plug#begin('~/.local/share/nvim/plugged')

" gruvbox retro
Plug 'morhetz/gruvbox'

" solarized true color
"Plug 'frankier/neovim-colors-solarized-truecolor-only'

Plug 'jiangmiao/auto-pairs'
" molokai
Plug 'fatih/molokai'
" go development
"Plug 'fatih/vim-go'
" Deoplete for go
"Plug 'zchee/deoplete-go', {'do': 'make'}
" JS development
"Plug 'pangloss/vim-javascript'
" Local buffer completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Supertab
Plug 'ervandew/supertab'

" --- The stack to start of with JS Development
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx']  }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx']  }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx']  }

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" rust.vim
Plug 'rust-lang/rust.vim'
" deoplete-rust via racer
"Plug 'sebastianmarkow/deoplete-rust'
" Vim Racer Plugin
Plug 'racer-rust/vim-racer'

" Langauge server protocol framework
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" PHP completion via LC-neovim
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" Autocompletion framework
"Plug 'roxma/nvim-completion-manager'
"
call plug#end()
" Vim-Plug end()

" * -----------  Global Config Section ---------- *

" Automatic indentation according to filetype
filetype plugin indent on

" Color, who doesn't like colours?!
syntax enable
set termguicolors
colorscheme molokai
set background=dark
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme zellner

"highlight Cursor guibg=Golden

set encoding=utf-8
set hidden 		" for LanguageServer

" Show line numbers
set number
set relativenumber

" display cursor position
set ruler

" indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

set title

set cul!

" set pastetoggle
set pastetoggle=<F2>

" set window split positioning
set splitright

" disable automatic insertion of line comment '//' - formatoptions
au FileType rust setlocal fo-=c fo-=r fo-=o

" automatically save every time we build/make something
"set autowrite

" set current pwd
autocmd BufEnter * silent! lcd %:p:h

" * ---------- Mappings / Navigation---------- *
let mapleader = ";"

imap jk <Esc>

map <UP>    <NOP>
map <DOWN>  <NOP>
map <LEFT>  <NOP>
map <RIGHT> <NOP>

" Test currrent time shortcut F-key
map <F3> :echo 'Current time is ' . strftime('%c')<CR>

" Compile and execute file
map <F5> :RustRun<CR>

" switch buffers
nnoremap <F12> :buffers<CR>:buffer<Space>

" Save readonly files when editing sudo files
map sw <ESC>:w !sudo tee % > /dev/null<CR>

" Save in all modelines
noremap     <silent> <C-S> :update!<CR>
"inoremap    <silent> <C-S> :update<CR>
vnoremap    <silent> <C-S> :update!<CR>

nnoremap <leader>bl :ls<CR>         "list buffers
nnoremap <Leader>en :enew<CR>       "new buffer
nnoremap bn :bnext<CR>              "next buffer
nnoremap bp :bprevious<CR>          "previous buffer
nnoremap bd :bdelete<CR>            "delete current buffeg

"nnoremap j jzz
"nnoremap k kzz
nnoremap <Leader>fz :FZF<CR>

" This unserts the 'last search pattern' register by hitting <ESC>
nnoremap <ESC> :noh<CR><ESC>

" * ---------- PHP Config Section ---------- *
" PHP Indentation / Syntax / Autocmd's
" Language server
"autocmd FileType php LanguageClientStart
"set filetype=php expandtab ts=4 sw=4 autoindent smartindent

" * ---------- Autocomplete ---------- *
" --- General Config
set shortmess+=c
" Use <Enter> key to hide the popup menu
"inoremap <expr> <CR> (pumvisible() ? "\<C-y>\<CR>" : "\<CR>")
" Use TAB and Shift Tab to select items from the menu
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Deoplete
let g:deoplete#enable_at_startup = 1

" Ctags for completion
"set tags=~/Documents/Website/Inventory/php-plain-starter/tags

" Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Powerline for nvim (local)
" set laststatus for the line
"set rtp+=/usr/loca/lib/python3.5/dist-packages/powerline/bindings/nvim
"set laststatus=2
"
"  Recommended by the package
set completeopt=longest,menuone,preview

" ------- Path to python interpreter for neovim
let g:python3_host_prog = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" ------------ Golang neovim config ~
"  vim-go config
"autocmd FileType go nmap <Leader>b <Plug>(go-build)
"autocmd FileType go nmap <Leader>r <Plug>(go-run)

" -------- Deoplete GO specific config settings
" -- Run deoplete.nvim automatically
"  Already found in line 119
" -- gocode Binary to improve performance
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
" -- Automatically insert dor for after package name
let g:deoplete#sources#go#package_dot = 1
" -- Class Sorting and Ignore
let g:deoplete#sources#sort_class = ['package', 'func', 'type', 'var', 'const']
" -- Use caching
let g:deoplete#sources#go#use_cache = 1
" -- JSON dir
"let g:deoplete#sources#go#json_directory = '/path/to/data_dir'
" -- Support pointer match?
"let g:deoplete#sources#go#pointer
" -- cgo complete use libclang-python3
"let g:deoplete#sources#go#cgo = 1


" -------------------- Web Dev Plugin Config ------------------
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" init deoplete#omni#functions
let g:deoplete#omni#functions = {}
" use declared deoplete#omni#functions
let g:deoplete#omni#functions = [
    \ 'tern#Complete',
    \ 'jspc#omni'
    \]

let g:deoplete#sources ={}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Tab settings; Use Tab for everything (except Ultisnips!)
autocmd Filetype javascript let g:SuperTabDefaultCompletionType = <c-x><x-o>
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Tern specific config
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
" set completeopt-=preview


" ------------------------ Rust config --------------------

let g:rustfmt_autosave = 1

" deoplete-rust
" racer path
"let g:deoplete#sources#rust#racer_binary='/home/lunixchewbahka/.cargo/bin'
" rust-src path
"let g:deoplete#sources#rust#rust_source_path='$RUST_SRC_PATH'
" duplicate matches
"let g:deoplete#sources#rust#show_duplicates=1
" set max height od documentation split
"let g:deoplete#sources#rust#documentation_max_height=20

" vim-racer config ---
let g:racer_cmd="$HOME/.cargo/bin/racer"
let g:racer_experimental_completer=1

" vim-racer mappings
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
