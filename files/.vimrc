"
" INITIAL SETTINGS
"

" set statusline+=%#constant#%-14.(\ \ col:\ %c%) " Show the column at the bottom in the statusline.
set statusline=%<%#constant#%(\ \ col:\ %c%)\  " Show the column at the bottom in the statusline.


"
" NEOBUNDLE SECTION
" 
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

" javascript syntax highlighting
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

"typescript syntax highlighting
NeoBundle 'leafgarland/typescript-vim'

" tsx
NeoBundle 'ianks/vim-tsx'

" blinks search result after jumping to it
" This doesn't install with NeoBundle, so git clone the project at ~/.vim/bundles
NeoBundle 'ivy/vim-bling'
let g:bling_color_fg = 'cyan'
let g:bling_color_gui_fg = 'cyan'
let g:bling_count = 1

" extra color schemes
NeoBundle 'flazz/vim-colorschemes'

" indents visualized
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1 " enable on startup

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
" let g:syntastic_javascript_eslint_exe='(npm bin)/eslint'

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

" The best plugin ever. Requires vim-repeat to be installed.
NeoBundle 'svermeulen/vim-easyclip'
let g:EasyClipAutoFormat = 1 " there is also a way to bind a toggle functionality for this
let g:EasyClipPreserveCursorPositionAfterYank = 1
" allow for s<motion> to substitute over the given motion with a specifified
" register. Use ss to paste over the line. Use gs the same as s but preserves
" the cursor position
let g:EasyClipUseSubstituteDefaults = 1
" control+v to use EasyClips pasting while in insert mode
imap <c-v> <plug>EasyClipInsertModePaste 
" map command+v to use EasyClips pasting while in insert mode... TODO not working 
imap <silent> <D-v> <plug>EasyClipInsertModePaste 
set clipboard=unnamed,unnamedplus   " yanking adds to + and * registers. system clipboard is the * register btw.
" remap m to be cut and M to cut end of line
nnoremap gm m
nmap M <Plug>MoveMotionEndOfLinePlug



" Autocomplete
NeoBundle 'tpope/vim-endwise'

" Git wrapper. 
NeoBundle 'tpope/vim-fugitive'
let minWidth = 4
let maxWidth = 40
" manipulate string given by fugitive
set statusline+=\[%h%m%r%{strpart(fugitive#statusline(),minWidth,maxWidth)}
"filename
set statusline+=\ %f
NeoBundle 'shumphrey/fugitive-gitlab.vim' " gitlab plugin for vim-fugitive
let g:fugitive_gitlab_domains = ['http://git', 'http://git.tcncloud.net'] " for private gitlab domains


" ~~~~~~~~~~~ END ~~~~~~~~~~~~~
       
" Required:
filetype plugin indent on


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end() "neobundle end

"PERSONAL SECTION
"  _____       _            _             _   _      _       _     _   
" / ____|     | |          (_)           | | | |    (_)     | |   | |  
"| (___   ___ | | __ _ _ __ _ _______  __| | | |     _  __ _| |__ | |_ 
" \___ \ / _ \| |/ _` | '__| |_  / _ \/ _` | | |    | |/ _` | '_ \| __|
" ____) | (_) | | (_| | |  | |/ /  __/ (_| | | |____| | (_| | | | | |_ 
"|_____/ \___/|_|\__,_|_|  |_/___\___|\__,_| |______|_|\__, |_| |_|\__|
"                                                       __/ |          
"                                                      |___/           

colorscheme solarized   " Do this first so that later commands aren't overwritten. All hail solarized light
set background=light


set guifont=Fira\ Code:h18
set lines=50 " initial window size
set columns=300 " initial window size

filetype indent on      " load filetype-specific indent files
filetype plugin on      " load native plugins

set term=xterm-256color 
set t_Co=256        " use 256 colors
syntax on           " enable syntax processing

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " changes the amount of spaces << and >> move the text
set ignorecase      " ignorecase or infercase? The question of the century.

set number              " show line numbers
set relativenumber      " show line numbers relative to your current line
set cursorline          " highlight current line

set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight all search pattern matches

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set synmaxcol=400 "only syntax higlight first 400 columns, increases performance on weird files
set tabpagemax=100 " we can have 100 tabs open. This extends the default
set scrolloff=5 "keep the cursor vertically centered

set laststatus=2 " always draw statusline
set titlestring=🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥 " empty the title string

" map enter and shift enter to insert a new line while staying in command mode
nmap <S-Enter> O<Esc>  
nmap <CR> o<Esc>       

" map space to insert a single space ahead of the cursor
nmap <Space> a<Space><Esc>

" map Shift-Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <S-Space> :nohlsearch<Bar>:echo<CR>


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

" Allow <C-n> and <C-p> to use the dictionary for recommended words. 
set spell
set complete+=kspell
" Only spell check SpellLocal and SpellBad (use :h hl-SpellBad)
hi clear SpellCap
hi clear SpellRare

set backupcopy=yes


" augroup is used to prevent a buildup of autocmd's whenever .vimrc is sourced
augroup autocmds
  "autocmd! " clear the augroup. if this isn't done often vim will be slowed down
  " spell check for text files
  autocmd BufNewFile,BufRead *.txt,*.md,*.markdown,*.rst setlocal spell

  " press f5 and open a markdown file into google chrome.
  " Requires: https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl
  " Check "Allow access to file URLs in chrome://extensions
  autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome" %:p:.<CR>'

  autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.js,*.jsx setlocal filetype=javascript.jsx
  autocmd FileType gitcommit setlocal spell
  " automatically resize splits when vim is resized
  autocmd VimResized * wincmd =

  " Set conceallevel=0 for every filetype. Conceallevel really is dumb, I hate that ishhhhh
  set cole=0
  autocmd FileType * setl cole=0

  " Comment // for cpp and proto files
  autocmd FileType cpp,cc,proto setlocal commentstring=\/\/\ %s

augroup END

