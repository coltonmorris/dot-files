CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
NEO_PATH = '/Users/colton.morris/go/src/neo/'

require('plugins')
require('settings')
require('autocmd')
require('keybinds')

-- want to change stuff? look in `config/lsp/init.lua`
require('config.lsp').init()
