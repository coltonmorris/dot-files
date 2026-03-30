local lsp = require('config.lsp')
lsp.setup('elixirls', {
  cmd = { DATA_PATH .. "/lsp_servers/elixir/elixir-ls/language_server.sh" },
  capabilities = lsp.common_capabilities(),
  on_attach = lsp.common_on_attach,
})

-- needed for the LSP to recognize elixir files (alternativly just use elixir-editors/vim-elixir)
vim.cmd([[
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au BufRead,BufNewFile *.eex,*.leex,*.sface set filetype=eelixir
  au BufRead,BufNewFile mix.lock set filetype=elixir
]])
