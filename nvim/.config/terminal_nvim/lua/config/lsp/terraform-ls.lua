local lsp = require('config.lsp')
lsp.setup('terraformls', {
  cmd = { DATA_PATH .. "/lsp_servers/terraform/terraform-ls", "serve" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
