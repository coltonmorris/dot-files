local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    require'lsp_signature'.on_attach()
end

function lsp_config.common_capabilities(client, bufnr)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return capabilities
end

function lsp_config.init()
    require('config.lsp.angular-ls')
    require('config.lsp.bash-ls')
    require('config.lsp.clangd')
    require('config.lsp.cmake-ls')
    require('config.lsp.css-ls')
    require('config.lsp.dart-ls')
    require('config.lsp.docker-ls')
    require('config.lsp.efm-general-ls')
    require('config.lsp.elm-ls')
    require('config.lsp.emmet-ls')
    require('config.lsp.graphql-ls')
    require('config.lsp.go-ls')
    require('config.lsp.html-ls')
    require('config.lsp.json-ls')
    require('config.lsp.js-ts-ls')
    require('config.lsp.kotlin-ls')
    require('config.lsp.latex-ls')
    require('config.lsp.lua-ls')
    require('config.lsp.php-ls')
    require('config.lsp.python-ls')
    require('config.lsp.ruby-ls')
    require('config.lsp.rust-ls')
    require('config.lsp.svelte-ls')
    require('config.lsp.terraform-ls')
    -- require('config.lsp.tailwindcss-ls')
    require('config.lsp.vim-ls')
    require('config.lsp.vue-ls')
    require('config.lsp.yaml-ls')
    require('config.lsp.elixir-ls')

    lsp_config.make_stuff_pretty()
end

function lsp_config.make_stuff_pretty()
    -- change the border of the hover window
    local border = {
          {"┏", "FloatBorder"},
          {"━", "FloatBorder"},
          {"┓", "FloatBorder"},
          {"┃", "FloatBorder"},
          {"┛", "FloatBorder"},
          {"━", "FloatBorder"},
          {"┗", "FloatBorder"},
          {"┃", "FloatBorder"},
    }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
end

return lsp_config
