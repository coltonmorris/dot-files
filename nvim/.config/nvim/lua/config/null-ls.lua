local null_ls = require("null-ls")

null_ls.setup{
    sources = {
        require("null-ls").builtins.diagnostics.vale,
        null_ls.builtins.code_actions.gitsigns,
    },
}
