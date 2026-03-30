-- npm i -g bash-language-server
local lsp = require('config.lsp')
lsp.setup('bashls', {
  cmd = { DATA_PATH .. "/lsp_servers/bash/node_modules/.bin/bash-language-server", "start" },
  on_attach = lsp.common_on_attach,
  filetypes = { "sh", "zsh" },
  capabilities = lsp.common_capabilities(),
})
