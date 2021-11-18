local lspkind = require("lspkind")
lspkind.init()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require "cmp"

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

cmp.setup.cmdline(':', {sources = {{name = 'cmdline'}}})

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        -- TODO maybe dont want enter (carriage return) to be a mapping
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },

    -- the order you put these in are the ranking you want it shown up
    sources = cmp.config.sources({
        {name = "rp", keyword_length = 4}, -- make sure `brew install ripgrep`
        {name = "npm", keyword_length = 4}, -- only active for package.json
        {name = "nvim_lua"}, -- nice for nvim development
        {name = "nvim_lsp"}, -- not sure exactly
        {name = "calc"}, -- nice for math
        {name = "spell", keyword_length = 5}, -- based on vim's spellsuggest
        {name = "emoji"}, -- emoji's are cool
        {name = 'buffer', keyword_length = 5}, -- only show buffer after word is past n chars long
        {name = "path"}, -- local file path completion
        {name = 'vsnip'} -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }),
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                rg = "[ripgrep]",
                npm = "[npm]",
                nvim_lua = "[api]",
                nvim_lsp = "[LSP]",
                buffer = "[buf]",
                spell = "[spell]",
                path = "[path]",
                -- luasnip = "[snip]",
                vsnip = "[snip]",
                emoji = "[emoji]",
                calc = "[calc]"
            }
        }
    },
    experimental = {native_menu = false, ghost_text = true}
})

-- TODO can mess with highlight groups for cmp and use material somehow
-- colorbuddy does something like exporting groups and styles, then define the cmp group on that colorbuddy group like so:
-- local Group = require("colorbuddy.group").Group
-- local g = require("colorbuddy.group").groups
-- Group.new("CmpItemAbbr", g.Comment)
-- g.Comment is the color of comments in the theme
