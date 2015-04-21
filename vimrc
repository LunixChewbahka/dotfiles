" Global Config
syntax on												" turn on syntax highlighting
syntax enable
filetype off											" enables filtype specific plugins

set rnu
set nonu
set nocompatible                " improve thyself
set tabstop=2
set shiftwidth=4
set softtabstop=4
set modeline modelines=5
set foldmethod=indent
set ruler
set title

set mouse=a

set backspace=indent,eol,start	" let the backspace key work 'normally' "

set nobackup
set nowritebackup



" mapleader is "\" by default
let mapleader=","

" Fold Settings
nnoremap <Space> za

" Quick ESC
imap qq <ESC>

" --- Editing Multiple lines in vim
" 1. Navigate to where you want the first quote to be.
" 2. Enter visual-block-mode which is Ctrl+v, then select the lines you want
"    to get affected, G to go to the bottom of the file.
" 3. Hit I"<ESC> or I<any character/pattern you want to insert><ESC>
" 4. Move to the next spot you want to insert a " or <any char>.
" 5. You want to repeat what you just did so a simple '.' will suffice.

" --- Working with multiple files in vim
" :e filename - Edit a file in a new buffer
" :bnext (or :bn) - go to next buffer
" :bprev (of :bp) - go to previous buffer
" :bd - delete a buffer (close a file)
" :sp filename - Open a file in a new buffer and split window
" ctrl+ws - Split windows
" ctrl+ww - switch between windows
" ctrl+wq - Quit a window
" ctrl+wv - Split windows vertically
"
nnoremap <F2> :bp<CR>								" go to previous buffer
nnoremap <F3> :bn<CR>								" go to next buffer
nnoremap <F4> <C-W>w								" handy to scroll between open windows
nnoremap <F5> :ls<CR>								" browse running buffers
nnoremap <F6> :buffers<CR>:buffer<Space>
nnoremap <F7> :bw<CR>								" delete current buffer
nnoremap gb :buffers<CR>:sb<Space>


" Literally remove arrow keys for discipline :/
" Warning! not for the WEAK!
noremap <Up>		<NOP>
noremap <Down>	<NOP>
noremap <Left>	<NOP>
noremap <Right> <NOP>
" Remove h, j, k, l - might aswell use ge commands w,b,e
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>

"------------------------------------------------------------------------------
"" Wrap visually selected text in parantheses
"------------------------------------------------------------------------------
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
autocmd InsertEnter * highlight Cursorline cterm=NONE ctermbg=Blue ctermfg=White guibg=Green guifg=Green
autocmd InsertLeave * highlight Cursorline cterm=NONE ctermbg=DarkGreen ctermfg=White guibg=DarkBlue guifg=White

" Set comments to italic

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
Bundle 'joequery/Stupid-EasyMotion'
Bundle 'bling/vim-airline'
" Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-fugitive'
Bundle 'flazz/vim-colorschemes'
" Bundle 'davidhalter/jedi-vim'							" ycm already has this built in
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'klen/python-mode'
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
		set background=light
else
		set t_Co=256
		set background=dark
		colorscheme monokain
endif

" Settings for YouCompleteMe
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"Settings for vim-indent-guides
" ~Terminal mode
" hi IndentGuidesOdd   ctermbg=white
" hi IndentGuidesEven  ctermbg=darkgrey
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 4
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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" -----------------------------------------------------
" Easymotion shortcuts
" -----------------------------------------------------
map <C-O> <Leader><LeadeR>w
map <C-E> <Leader><Leader>W
map T <Leader><Leader>f

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
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>

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
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger=""
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

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
let g:pymode_rope = 1

let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

let g:pymode_lint_write = 1

"" Settings for pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 5

"" Settings for vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
