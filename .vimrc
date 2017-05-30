" NEOBUNDLE SECTION
" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ~~~~~~~~ MY BUNDLES HERE ~~~~~~~~~
"       
" Note: You don't set neobundle setting in .gvimrc!
"

" extra color schemes
NeoBundle 'flazz/vim-colorschemes'

" indents visualized
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_gui = '#BDBDBD' "Gvim

" syntax checker
NeoBundle 'scrooloose/syntastic' 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌ '
let g:syntastic_style_error_symbol = '⁉️ '
let g:syntastic_warning_symbol = '⚠️ '
let g:syntastic_style_warning_symbol = '💩 '

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Used for commenting! Type gcc for one line, or gc* (example: gcap --comment around paragraph)
NeoBundle 'tpope/vim-commentary'

" Plugin that other plugins use. Makes the repeat command '.' work
NeoBundle 'tpope/vim-repeat'

" ~~~~~~~~~~~ END ~~~~~~~~~~~~~
       
" Required:
filetype plugin indent on


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end() "neobundle end

"PERSONAL SECTION

filetype indent on      " load filetype-specific indent files
filetype plugin on      " load native plugins

colorscheme solarized   " awesome colorscheme
set background=light

set term=xterm-256color 
set t_Co=256        " use 256 colors
syntax on           " enable syntax processing


set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " changes the amount of spaces << and >> move the text
set ignorecase      " ignore case on search

set number              " show line numbers
set relativenumber      " show line numbers relative to your current line
set cursorline          " highlight current line

set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight all search pattern matches

" map enter and shift enter to insert a new line while staying in insert mode
nmap <S-Enter> O<Esc>  
nmap <CR> o<Esc>       
       
" map space to insert a single space ahead of the cursor
nmap <Space> a<Space><Esc>

" map Shift-Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <S-Space> :nohlsearch<Bar>:echo<CR>


set clipboard=unnamed   " yanking adds to clipboard

set shell=/bin/bash " so that fish doesn't interfere

" Only for MacVim. Bind cmd+num to switch through tabs
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>

" Use correct language for spellcheck (cos to toggle; z= for corrections).
set spelllang=en_gb 

" augroup is used to prevent a buildup of autocmd's whenever .vimrc is sourced
augroup autocmds
  "autocmd! " clear the augroup. if this isn't done often vim will be slowed down
  " spell check for text files
  autocmd BufNewFile,BufRead *.txt,*.md,*.markdown,*.rst setlocal spell
  autocmd FileType gitcommit setlocal spell

augroup END
