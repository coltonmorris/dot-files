local lsp = require('config.lsp')
lsp.setup('gopls', {
  cmd = { "gopls" },
  settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
  init_options = { usePlaceholders = true, completeUnimported = true },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
