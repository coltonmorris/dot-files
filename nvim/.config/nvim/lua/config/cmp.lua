local lspkind = require("lspkind")
lspkind.init()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require("cmp")
-- local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

-- not really a huge fan of having this instead of the wildmenu
-- cmp.setup.cmdline(':', {sources = {{name = 'cmdline'}}})

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        -- TODO maybe dont want enter (carriage return) to be a mapping
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-n>'] = cmp.mapping.confirm({select = true}),
        --     cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.mapping.select_next()
        --     -- elseif luasnip.expand_or_jumpable() then
        --     --     luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback()
        --     end
        -- end, {'i','c'}),
        ['<C-p>'] = cmp.mapping.confirm({select = true}),
        --     cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     -- elseif luasnip.jumpable(-1) then
        --     --     luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, {'i','c'}),
    },

    -- the order you put these in are the ranking you want it shown up
    sources = cmp.config.sources({
        {name = 'copilot'},
        {name = "rp", keyword_length = 4}, -- make sure `brew install ripgrep`
        {name = "npm", keyword_length = 4}, -- only active for package.json
        {name = "nvim_lua"}, -- nice for nvim development
        {name = "nvim_lsp"}, -- for lsp completions
        {name = "calc"}, -- nice for math
        {name = "spell", keyword_length = 5}, -- based on vim's spellsuggest
        {name = "emoji"}, -- emoji's are cool
        {name = 'buffer', keyword_length = 5}, -- only show buffer after word is past n chars long
        {name = "path"}, -- local file path completion
        -- {name = 'luasnip'} 
    }),
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                copilot = "[AI]",
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
