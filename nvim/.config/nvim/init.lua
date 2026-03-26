-- CONFIG_PATH = vim.fn.stdpath('config')
-- DATA_PATH = vim.fn.stdpath('data')
-- CACHE_PATH = vim.fn.stdpath('cache')
-- NEO_PATH = '/Users/colton.morris/go/src/neo/'
--
-- require('impatient')
-- require('settings')
-- require('plugins')
-- require('autocmd')
-- require('keybinds')

vim.opt.clipboard = "unnamed,unnamedplus" -- yanking adds to + and * registers. system clipboard is the * register btw.

if vim.g.vscode then
  -- VSCode Neovim
  require "vscode_keymaps"
else
  -- Ordinary Neovim
end

