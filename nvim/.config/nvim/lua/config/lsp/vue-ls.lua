
require('lspconfig').vuels.setup {
    cmd = {DATA_PATH .. "/lsp_servers/vue/node_modules/.bin/vls", "--stdio"},
    on_attach = require'config.lsp'.common_on_attach,
    root_dir = require('lspconfig').util.root_pattern(".git", ".")
}
