-- npm install -g vscode-html-languageserver-bin
local lsp = require('config.lsp')
lsp.setup('html', {
  cmd = {
    "node",
    DATA_PATH .. "/lsp_servers/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
    "--stdio",
  },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
