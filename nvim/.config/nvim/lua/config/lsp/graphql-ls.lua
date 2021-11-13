-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup {on_attach = require'config.lsp'.common_on_attach}
