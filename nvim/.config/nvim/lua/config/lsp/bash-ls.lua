-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/bash/node_modules/.bin/bash-language-server", "start"},
    on_attach = require'config.lsp'.common_on_attach,
    filetypes = { "sh", "zsh" },
    capabilities = require'config.lsp'.common_capabilities(),
}
