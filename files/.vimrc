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
"


" context of the function off screen
NeoBundle 'wellle/context.vim'

NeoBundle 'ryot4/diary.vim'
let g:diary_dir = expand('~/Journal')
let g:diary_template = expand('~/Journal/template')

NeoBundle 'zchee/vim-flatbuffers'

" auto sets shiftwidth
NeoBundle 'tpope/vim-sleuth'

" elm!
" NeoBundle 'ElmCast/elm-vim'
NeoBundle 'elmcast/elm-vim'

" go!
NeoBundle 'fatih/vim-go'

" editor config for syntax
NeoBundle 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " makes fugitive work with this plugin

" javascript syntax highlighting
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

"typescript syntax highlighting
NeoBundle 'leafgarland/typescript-vim'

" tsx
NeoBundle 'ianks/vim-tsx'

" extra color schemes
NeoBundle 'flazz/vim-colorschemes'

" indents visualized
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1 " enable on startup

" Used for commenting! Type gcc for one line, or gc* (example: gcap --comment around paragraph)
NeoBundle 'tpope/vim-commentary'

" all about surroundings
NeoBundle 'tpope/vim-surround'

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
" remap the mark to be gm instead
nnoremap gm m
" remap m to be cut and M to cut end of line
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
NeoBundle 'tpope/vim-rhubarb' " echo 'machine api.github.com login <user> password <token>' >> ~/.netrc

" git gutter info
NeoBundle 'airblade/vim-gitgutter'
set updatetime=300 "set to 100 or lower to make gutter signs show quicker
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '📝'
let g:gitgutter_sign_removed = '🗑'
let g:gitgutter_sign_removed_first_line = '🥇'
let g:gitgutter_sign_modified_removed = '♻️'


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

set backspace=indent,eol,start

set guifont=Fira\ Code:h18
set lines=50 " initial window size
set columns=300 " initial window size

set term=xterm-256color 
set t_Co=256        " use 256 colors
syntax on           " enable syntax processing
syntax enable       " enable syntax processing

" vim sleuth does these
  " set softtabstop=2   " number of spaces in tab when editing
  " set expandtab       " tabs are spaces
  " set shiftwidth=2    " changes the amount of spaces << and >> move the text
  " set tabstop=2       " number of visual spaces per TAB
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


set shell=/bin/zsh " so that fish doesn't interfere

" Only for MacVim. Bind cmd+num to switch through tabs
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>

" Use correct language for spellcheck (cos to toggle; z= for corrections).
set spelllang=en_us 
" Allow <C-n> and <C-p> to use the dictionary for recommended words. 
set spell
set complete+=kspell
" Only spell check SpellLocal and SpellBad (use :h hl-SpellBad)
hi clear SpellCap
hi clear SpellRare
set spellsuggest=fast,20 "don't show too much suggestion for spell check.

" TODO why is this even here?
set backupcopy=yes


" augroup is used to prevent a buildup of autocmd's whenever .vimrc is sourced
augroup autocmds
  "autocmd! " clear the augroup. if this isn't done often vim will be slowed down

  " for files with no extension, set them to markdown filetype
  " autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set ft=markdown | set background=dark | endif

  " spell check for text files
  autocmd BufNewFile,BufRead *.txt,*.md,*.markdown,*.rst setlocal spell

  " press f5 and open a markdown file into google chrome.
  " Requires: https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl
  " Check "Allow access to file URLs in chrome://extensions
  autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome" %:p:.<CR>'

  " force filetypes
  autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.js,*.jsx setlocal filetype=javascript.jsx
  autocmd BufNewFile,BufRead *.fbs setlocal filetype=fbs
  autocmd BufNewFile,BufRead *.plz setlocal filetype=bzl
  autocmd BufNewFile,BufRead *.build_defs setlocal filetype=python

  autocmd FileType gitcommit setlocal spell
  " automatically resize splits when vim is resized
  autocmd VimResized * wincmd =

  " Set conceallevel=0 for every filetype. Conceallevel really is dumb, I hate that ishhhhh
  set cole=0
  autocmd FileType * setl cole=0

  " Comment // for cpp and proto files
  autocmd FileType cpp,cc,proto setlocal commentstring=\/\/\ %s

  " Comment # for plz files
  autocmd FileType plz setlocal commentstring=\# %s

augroup END
