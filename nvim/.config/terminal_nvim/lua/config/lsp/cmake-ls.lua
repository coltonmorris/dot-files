local lsp = require('config.lsp')
lsp.setup('cmake', {
  cmd = { DATA_PATH .. '/lsp_servers/cmake/venv/bin/cmake-language-server' },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
  filetypes = { "cmake" },
})
