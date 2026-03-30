-- npm install -g vscode-css-languageserver-bin
local lsp = require('config.lsp')
lsp.setup('cssls', {
  cmd = {
    "node",
    DATA_PATH .. "/lsp_servers/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
    "--stdio",
  },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
