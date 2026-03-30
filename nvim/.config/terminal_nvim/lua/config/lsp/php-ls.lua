local lsp = require('config.lsp')
lsp.setup('intelephense', {
  cmd = { DATA_PATH .. "/lsp_servers/php/node_modules/.bin/intelephense", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
