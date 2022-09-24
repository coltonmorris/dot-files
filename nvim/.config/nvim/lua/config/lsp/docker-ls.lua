-- npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/dockerfile/node_modules/.bin/docker-langserver", "--stdio"},
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
    root_dir = vim.loop.cwd
}
