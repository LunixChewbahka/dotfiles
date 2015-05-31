" Global Config
syntax on					    " turn on syntax highlighting
syntax enable
filetype off					" enables filtype specific plugins

set rnu
set nonu
set nocompatible                " improve thyself
set tabstop=2
set shiftwidth=4
set softtabstop=4
set modeline modelines=5
" set foldmethod=indent
set ruler
set title
set mouse=a
set backspace=indent,eol,start	" let the backspace key work 'normally' "
set nobackup
set nowritebackup
" set autochdir

" mapleader is "\" by default
let mapleader=","

" Fold Settings
nnoremap <Space> za

" Quick ESC
imap jj <ESC>

" Save using Ctrl+S mappings
nmap <C-S> :w<CR>
vmap <C-S> <Esc><C-S>gv
imap <C-S> <Esc><C-S>

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <C-O><F2>

" copy pasterino
" set pastetoggle=<F12>
" buffer switch
nnoremap <F5> :buffers<CR>:buffer<Space>
" This is nice but a little bit slow
nnoremap <F4> :bw<CR>								" delete current buffer
nnoremap <F6> :ls<CR>								" browse running buffers
nnoremap gb :buffers<CR>:sb<Space>

" Literally remove arrow keys for discipline :/
" Warning! not for the WEAK!
noremap <Up>	<NOP>
noremap <Down>	<NOP>
noremap <Left>	<NOP>
noremap <Right> <NOP>
" Remove h, j, k, l - might aswell use ge commands w,b,e
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>

" ------------------------------------------------------------------------------
" Switch and Split Window in vim
" ------------------------------------------------------------------------------
" --- Easier split navigations
" So instead of Ctrl-w then j, it's just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" --- More natural split opening
" : Open new splits to right and bottom, which feels natural than Vim's default
set splitbelow
set splitright

" --- Resizing Splits
" : Vim's defaults are useful for changing split shapes:
" 1. Max out the height of the current split
"						Ctrl + w _
" 2. Max out the width of the current split
"						Ctrl + w |
" 3. Normalize all split sizes, which is very handy when resizing terminal
"						Ctrl + w =

" --- More Split Manipulation
" 1. Swap top/bottom or left/right split
"						Ctrl + W R
" 2. Break out current window into a new tabview
"						Ctrl + W T
" 3. Close every window in the current tabview but the current one
"						Ctrl + W o

" ============================================================
" nnoremap <A-Up> :normal <c-r>=SwitchWindow('+')<CR><CR>
" nnoremap <A-Down> :normal <c-r>=SwitchWindow('-')<CR><CR>
" nnoremap <A-Left> :normal <c-r>=SwitchWindow('<')<CR><CR>
" nnoremap <A-Right> :normal <c-r>=SwitchWindow('>')<CR><CR>
"
" function! SwitchWindow(dir)
" 		let this = winnr()
"  		if '+' == a:dir
"  				execute "normal \<c-w>k"
" 		elseif '-' == a:dir
"  				execute "normal \<c-w>j"
"  		elseif '>' == a:dir
"  				execute "normal \<c-w>l"
"  		elseif '<' == a:dir
" 				execute "normal \<c-w>h"
"  		else
" 				echo "oops. check your ~/.vimrc"
" 				return ""
"  		endif
" endfunction
" =============================================================

"-------------------------------------------------------------------------------
"" Wrap visually selected text in parantheses
"-------------------------------------------------------------------------------
vnoremap ((  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap ))  <ESC>`<i(<ESC>`><right>a)<ESC>
vnoremap {{  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap }}  <ESC>`<i{<ESC>`><right>a}<ESC>
vnoremap ""  <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ''  <ESC>`>a'<ESC>`<i'<ESC>
vnoremap ``  <ESC>`>a`<ESC>`<i`<ESC>
vnoremap [[  <ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]]  <ESC>`<i[<ESC>`><right>a]<ESC>`]`]`}`}`)`))

" Settings for cursor highlight toggle in and out of insert mode
set cursorline
highlight Cursorline cterm=NONE ctermbg=DarkGreen ctermfg=White guibg=NONE guifg=White
autocmd InsertEnter * highlight Cursorline cterm=NONE ctermbg=Blue ctermfg=White guibg=DarkGreen guifg=White
autocmd InsertLeave * highlight Cursorline cterm=NONE ctermbg=DarkGreen ctermfg=White guibg=DarkBlue guifg=White

" set working directory to the current file
autocmd BufEnter * silent! lcd %:p:h

" Automatic formatting
autocmd BufWritePre *.go :%s/\s\+$//e

" Format the entire file
nmap <leader>fef ggVG=

" Python specific settings
au BufNewFile,BufRead *.py set ft=python
		\ tabstop=4
		\ softtabstop=4
		\ shiftwidth=4
		\ smarttab
		\ expandtab

" Go specific settings
au BufNewFile,BufRead *.go set ft=go

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage iteself :)
" this is required!
Bundle 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end
" Plugin on GutHub repo
" My Bundles
Bundle 'Valloric/YouCompleteMe'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
" Bundle 'joequery/Stupid-EasyMotion'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
" Bundle 'ervandew/supertab'
" Bundle 'SirVer/ultisnips'
" Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-fugitive'
Bundle 'flazz/vim-colorschemes'
" Bundle 'davidhalter/jedi-vim'							" ycm already has this built in
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
" Bundle 'klen/python-mode'
" Bundle 'hdima/python-syntax'
Bundle 'rkulla/pydiction'
Bundle 'nvie/vim-flake8'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'octol/vim-cpp-enhanced-highlight'

call vundle#end()						" required
filetype plugin indent on		" required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Settings for solarized
" let g:solarized_termcolors=256
if has('gui_running')
    colorscheme monokain
    set guifont=DejaVu\ Sans\ Mono\ 10
else
    colorscheme prettymolokai
endif

" Settings for YouCompleteMe
set completeopt+=longest
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_confirm_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

"Settings for vim-indent-guides
" ~Terminal mode
" hi IndentGuidesOdd   ctermbg=white
" hi IndentGuidesEven  ctermbg=darkgrey
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd	guibg=red   ctermbg=Grey
autocmd VimEnter,Colorscheme * :hi indentGuidesEven guibg=green ctermbg=DarkGrey

" Settings for delimitMate
let delimitMate_expand_cr = 1

" NERDtree configuration settings
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" -----------------------------------------------------
" Minimal vim-easymotion settings
" -----------------------------------------------------
"  disable default mappings
let g:EasyMotion_do_mapping = 0

" Basic Usage
nmap <Leader><Leader>w <Plug>(easymotion-w)
nmap <Leader><Leader>t <Plug>(easymotion-t)
" nmap <Leader><Leader>f <Plug>(easymotion-f)
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" s{char}{label}
" nmap s <Plug>(easymotion-s)
" or
" s{char}{char}{label}
" Need one more keystroke, but on average, it may be more comfortable
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotio_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" -----------------------------------------------------
" Thanks to joequery ^^,
" use Ctrl+L to toggle the line number counting method
" -----------------------------------------------------
function! g:ToggleNuMode()
	if &nu == 1
	    set rnu
	    set nonu
	else
	    set nu
		set nornu
	endif
endfunction
nnoremap <silent><Leader>l :call g:ToggleNuMode()<cr>

" -----------------------------------------------------
" bling/vim-airline Configuration
" -----------------------------------------------------
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1
" Smarter Tab Line
let g:airline#extensions#tabline#enabled = 1
" Fugitive master
let g:airline#extensions#branch#enabled = 1
" Set Airlinetheme
let g:airline_theme = 'badwolf'
let g:airline_mode_map = {
		\ '_' : '-',
		\ 'n' : 'N',
		\ 'i' : 'I',
		\ 'R' : 'R',
		\ 'c' : 'C',
		\ 'v' : 'V',
		\ 'V' : 'V',
		\ ' ' : 'V',
		\ 's' : 'S',
		\ 'S' : 'S',
		\}
" Fine Tuned Configuration for the vim-airline statusline

"----------------------------------------------------
" Make UltiSnips and YCM Compatible
" ---------------------------------------------------
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger=""
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']

let g:UltiSnipsEditSplit='vertical'

" -----------------------------------------------------
" Settings for CtrlP
" -----------------------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim

"" Settings for TagBar
nnoremap <F12> :TagbarToggle<cr>

"" Settings for vim-better-whitespace
highlight ExtraWhitespace ctermbg=White

"" Settings for python-mode
" let g:pymode_rope = 1

" let g:pymode_doc = 1
" let g:pymode_doc_key = 'K'
"
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

" let g:pymode_lint_write = 1

"" Settings for pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 5

"" Settings for vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
