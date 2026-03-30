local lsp = require('config.lsp')
lsp.setup('emmet_ls', {
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = { 'html', 'css' },
  root_dir = function(bufnr, on_dir)
    on_dir(vim.loop.cwd())
  end,
  settings = {},
})
