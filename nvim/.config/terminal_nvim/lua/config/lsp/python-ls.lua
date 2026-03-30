-- npm i -g pyright
local lsp = require('config.lsp')
lsp.setup('pyright', {
  cmd = { DATA_PATH .. "/lsp_servers/python/node_modules/.bin/pyright-langserver", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
