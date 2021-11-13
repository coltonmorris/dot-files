require'lspconfig'.svelte.setup {
    cmd = {DATA_PATH .. "/lspinstall/svelte/node_modules/.bin/svelteserver", "--stdio"},
    on_attach = require'config.lsp'.common_on_attach
}
