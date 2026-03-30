-- :LspInstall angular
local lsp = require('config.lsp')
lsp.setup('angularls', {
  cmd = { DATA_PATH .. "/lspinstall/angular/node_modules/@angular/language-server/bin/ngserver", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
