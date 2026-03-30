-- npm install -g yaml-language-server
local lsp = require('config.lsp')
lsp.setup('yamlls', {
  cmd = { DATA_PATH .. "/lsp_servers/yaml/node_modules/.bin/yaml-language-server", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
