-- rust-analyzer via rustaceanvim (not lsp.setup / nvim-lspconfig). Required from lsp_config.init().
-- See https://github.com/mrcjkb/rustaceanvim
local lsp = require('config.lsp')

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      lsp.common_on_attach(client, bufnr)
      vim.keymap.set('n', '<C-space>', function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
      end, { buffer = bufnr })
      vim.keymap.set('n', '<Leader>a', function()
        vim.cmd.RustLsp('codeAction')
      end, { buffer = bufnr })
    end,
  },
}
