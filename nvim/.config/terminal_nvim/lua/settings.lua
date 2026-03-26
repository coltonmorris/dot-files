-- this changes <Space> in normal mode ('n') to do nothing ('<NOP>')
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = vim.keycode("<space>")

vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo-dir")
vim.opt.undofile = true

vim.opt.path:append("**")     -- Enable recursive search for gf (go to file)
vim.opt.ignorecase = true     -- Ignore case in search
vim.opt.swapfile = false      -- Don't use swapfiles (we're using undodir instead)
vim.opt.scrolloff = 3         -- Keep 3 lines visible when scrolling

vim.opt.iskeyword:append("-") -- Treat dash-separated words as single words
-- TODO uncomment if getting annoyed by "hit enter" messages
-- vim.opt.shortmess:append("c")        -- Don't show messages in insert-completion menu
vim.opt.inccommand = "split" -- Live preview of :substitute

-- dont auto accept the completion menu
vim.o.completeopt = "menu,menuone,noinsert,fuzzy"

-- lets you navigate to a different file/buffer without saving
vim.o.hidden = true

vim.o.title = true
vim.opt.titleold = vim.fn.expand('$TERMINAL')
vim.o.titlestring = "%<%F%=%l/%L - nvim colton"

-- nvim searches for /spell directory to set spellfile automatically
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

-- makes diagnostics able to be on multiple lines
-- TODO maybe this is causing issues
-- vim.diagnostic.config({ virtual_lines = true })

vim.wo.wrap = true
-- TODO sets the popup menu's number of items max
-- vim.o.pumheight = 10 -- Makes popup menu smaller
vim.opt.fileencoding = "utf-8" -- The encoding written to file
vim.opt.cmdheight = 2          -- More space for displaying messages
vim.opt.mouse = "a"            -- Enable your mouse
vim.opt.splitbelow = true      -- Horizontal splits will automatically be below
vim.opt.termguicolors = true   -- set term gui colors most terminals support this
vim.opt.splitright = true      -- Vertical splits will automatically be to the right
vim.opt.conceallevel = 0       -- So that I can see `` in markdown files
vim.opt.expandtab = true       -- Converts tabs to spaces
vim.opt.smartindent = true     -- Makes indenting smart
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true   -- Enable highlighting of the current line
vim.opt.showtabline = 2     -- Always show tabs
vim.opt.showmode = false    -- We don't need to see things like -- INSERT -- anymore
vim.opt.backup = false      -- This is recommended by coc
vim.opt.writebackup = false -- This is recommended by coc
vim.opt.signcolumn = "yes"  -- Always show the signcolumn, otherwise it would shift the text each time
-- alot of plugins use this value to update after typing has stopped
vim.opt.updatetime = 300    -- Faster completion

-- default 1000. may be causing issues if too fast. assume you have 2 mappings: `gc` and `gcc`, this waits to see if you want to trigger `gcc` after typing `gc`
vim.opt.timeoutlen = 100
vim.opt.ttimeoutlen = 10

vim.opt.clipboard = "unnamed,unnamedplus" -- yanking adds to + and * registers. system clipboard is the * register btw.

-- vim.opt.nvim_tree_disable_netrw = 0
-- vim.opt.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 2 -- 4 open files in previon window, use 2 for vertical
vim.g.netrw_altv = 1         -- have window open on left

vim.opt.guifont = "FiraCode Nerd Font:h17"
