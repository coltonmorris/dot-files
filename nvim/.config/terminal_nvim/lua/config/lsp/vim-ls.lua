-- npm install -g vim-language-server
local lsp = require('config.lsp')
lsp.setup('vimls', {
  cmd = { DATA_PATH .. "/lsp_servers/vim/node_modules/.bin/vim-language-server", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
