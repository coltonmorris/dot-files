require'nvim-treesitter.configs'.setup {
    ensure_installed = {"go", "javascript", "typescript", "python"},
    ignore_install = {"haskell"},

    highlight = {enable = true},

    -- extends vim's `=` key
    indent = {enable = true},

    -- extends vim's `%` key.
    -- must have "andymass/vim-matchup" installed
    matchup = {
        enable = true,
    },

    -- rainbow parens and brackets
    -- must have "p00f/nvim-ts-rainbow" installed
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than N lines, int
    },

    -- auto close and auto rename html tags
    -- must have "windwp/nvim-ts-autotag" installed
    autotag = {enable = true},

    -- sets the comment string for files with multiple languages
    -- must have "JoosepAlviste/nvim-ts-context-commentstring" installed
    context_commentstring = {
        enable = true,
        -- disabled for nvim-comment
        enable_autocmd = false,
    },

    -- same as vim-matchup, extends `%` key
    -- must have "theHamsta/nvim-treesitter-pairs" installed
    pairs = {
        enable = true,
    },

    -- a built in, select code based off of treesitter nodes
    incremental_selection = {
      enable = true,
      keymaps = {
        -- mappings for incremental selection (visual mappings)
        init_selection = "gnn", -- maps in normal mode to init the node/scope selection
        node_incremental = "grn", -- increment to the upper named parent
        scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
        node_decremental = "grm", -- decrement to the previous node
      },
    },

    -- syntax-aware textobjects
    -- must have "nvim-treesitter/nvim-treesitter-textobjects" installed
    textobjects = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["DF"] = "@function.outer",
                ["DF"] = "@class.outer"
            }
        },

        keymaps = {
            ["iL"] = {
                -- you can define your own textobjects directly here
                go = "(function_definition) @function",
            },
            -- or you use the queries from supported languages with textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["ae"] = "@block.outer",
            ["ie"] = "@block.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["is"] = "@statement.inner",
            ["as"] = "@statement.outer",
            ["ad"] = "@comment.outer",
            ["am"] = "@call.outer",
            ["im"] = "@call.inner"
        },

        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer"
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer"
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer"
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer"
            }
        },

        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding xor succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            include_surrounding_whitespace = true,
        },

        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner"
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner"
            }
        }
    },
}


