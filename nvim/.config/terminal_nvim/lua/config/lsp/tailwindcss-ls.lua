local util = require('lspconfig.util')
local lsp = require('config.lsp')

lsp.setup('tailwindls', {
  cmd = {
    "node",
    DATA_PATH .. "/lsp_servers/tailwindcss/tailwindcss-intellisense/extension/dist/server/tailwindServer.js",
    "--stdio",
  },
  filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  init_options = {
    userLanguages = {},
  },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local dir = util.root_pattern('tailwind.config.js', 'tailwind.config.ts')(fname)
      or util.root_pattern('postcss.config.js', 'postcss.config.ts')(fname)
      or util.find_package_json_ancestor(fname)
      or util.find_node_modules_ancestor(fname)
      or util.find_git_ancestor(fname)
    on_dir(dir)
  end,
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
