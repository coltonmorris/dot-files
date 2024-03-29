local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    check_ts = true,
    ts_config = {
        lua = {'string'}, -- it will not add pair on that treesitter node
        javascript = {'template_string'},
        java = false -- don't check treesitter on java
    },
    -- check bracket in same line
    -- enable_check_bracket_line = false,
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% is only inside comment or string
npairs.add_rules({
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({'function'}))
})
