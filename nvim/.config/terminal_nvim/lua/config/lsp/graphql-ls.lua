-- npm install -g graphql-language-service-cli
local lsp = require('config.lsp')
lsp.setup('graphql', {
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
