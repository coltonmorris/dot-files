require'nvim-treesitter.configs'.setup {
    ensure_installed = {"go", "javascript", "typescript", "python"},
    ignore_install = {"haskell"},

    highlight = {enable = true},

    indent = {enable = true},

    matchup = {
        enable = true
    },

    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than N lines, int
    },

    autotag = {enable = true},

    autopairs = {enable = true},

    context_commentstring = {
        enable = true,
        -- disabled for nvim-comment
        enable_autocmd = false,
    },

    pairs = {
        enable = true,
    },

    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@conditional.outer",
                -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
                ["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },
            },
            -- You can choose the select mode (default is charwise 'v')
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@conditional.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding xor succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            include_surrounding_whitespace = true,
        },
    },
}

