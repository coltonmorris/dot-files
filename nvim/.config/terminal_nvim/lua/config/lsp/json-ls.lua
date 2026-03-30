-- npm install -g vscode-json-languageserver
local lsp = require('config.lsp')
lsp.setup('jsonls', {
  cmd = {
    "node",
    DATA_PATH .. "/lsp_servers/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    "--stdio",
  },
  on_attach = function(client, bufnr)
    lsp.common_on_attach(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
      vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
    end, {})
  end,
  capabilities = lsp.common_capabilities(),
})
