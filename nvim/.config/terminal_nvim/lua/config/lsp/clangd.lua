local lsp = require('config.lsp')
lsp.setup('clangd', {
  cmd = { DATA_PATH .. "/lsp_servers/clangd/clangd/bin/clangd", "--offset-encoding=utf-16" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
