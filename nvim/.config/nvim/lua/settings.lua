vim.cmd('let g:nvcode_termcolors=256')

-- TODO dont use the cmd api, its slower
vim.cmd('set undodir=~/.config/nvim/undo-dir')
vim.cmd('set undofile')

vim.cmd('set path+=**') -- when using gf (goto file) it finds files in other dirs
vim.cmd('set ignorecase') -- ignorecase or infercase? The question of the century.
vim.cmd('set noswapfile') -- dont need a swap because we have an undo dir
vim.cmd('set scrolloff=3') -- keep the cursor from going all the way to the bottom when scrolling

vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.o.hidden = true

vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.o.titlestring = "%<%F%=%l/%L - nvim colton"

vim.wo.wrap = true
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamed,unnamedplus" -- yanking adds to + and * registers. system clipboard is the * register btw.
-- vim.g.nvim_tree_disable_netrw = 0
-- vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4 -- 4 open files in previon window, use 2 for vertical
vim.g.netrw_winsize = 20
vim.g.netrw_altv = 1 -- have window open on left
vim.o.guifont = "FiraCode Nerd Font:h17"
