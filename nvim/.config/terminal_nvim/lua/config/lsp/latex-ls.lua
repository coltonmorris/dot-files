local lsp = require('config.lsp')
lsp.setup('texlab', {
  cmd = { DATA_PATH .. "/lsp_servers/latex/texlab" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
