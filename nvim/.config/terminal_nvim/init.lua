CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
NEO_PATH = '/Users/colton.morris/go/src/neo/'

-- ts_context_commentstring: disable CursorHold before any FileType (plugin loads before config.treesitter).
pcall(function()
  require('ts_context_commentstring.config').update({ enable_autocmd = false })
end)

-- require('impatient')
require('settings')
require('plugins')
require('autocmd')
require('keybinds')

-- want to change stuff? look in `config/lsp/init.lua`
require('config.lsp').init()
