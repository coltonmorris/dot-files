require'lspconfig'.terraformls.setup{
    cmd = {DATA_PATH .. "/lspinstall/terraform/terraform-ls", "serve"},
    on_attach = require'config.lsp'.common_on_attach
}
