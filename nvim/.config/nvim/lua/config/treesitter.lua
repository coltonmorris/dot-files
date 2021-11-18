require'nvim-treesitter.configs'.setup {
    autopairs = {enable = true},
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    matchup = {
        enable = true -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
    highlight = {enable = true},
    context_commentstring = {enable = true, config = {css = '// %s'}},
    incremental_selection = {
        enable = true,
        -- TODO try these out
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    textobjects = {enable = true},
    pairs = {
        enable = true,
        disable = {},
        highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
        highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
        goto_right_end = false, -- whether to go to the end of the right partner or the beginning
        fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
        keymaps = {goto_partner = "<leader>%"}
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
    },
    context = {enable = true},

    indent = {enable = true},
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- TODO seems to be broken
    -- indent = {enable = {"javascriptreact"}},
    autotag = {enable = true}
}

