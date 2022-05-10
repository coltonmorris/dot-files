require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true -- use `nowait` when creating keymaps
}

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", {noremap = true, silent = true})


-- GBrowse
vim.api.nvim_set_keymap("v", "<leader>w", ":GBrowse<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("v", "<leader>b", ":GBrowse<CR>", {noremap = true, silent = false})

-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
local vmappings = {
    ["/"] = {"<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment"}
}

local mappings = {
    ["/"] = "Comment",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["h"] = "No Highlight",
    -- ["P"] = "Projects", -- this a telescope thing?

    b = {
        name = "Buffers",
        c = {"<cmd>BufferClose<cr>", "Close"},
        p = {"<cmd>BufferLineCyclePrev<cr>", "Previous"},
        e = {"<cmd>BufferLinePickClose<cr>", "Pick which buffer to close"},
        l = {"<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left"},
        r = {"<cmd>BufferCloseBuffersRight<cr>", "Close all to the right"},
        D = {"<cmd>BufferLineSortByDirectory<cr>", "Sort by directory"},
        L = {"<cmd>BufferLineSortByExtension<cr>", "Sort by language"}
    },
    P = {
        name = "Packer",
        c = {"<cmd>PackerCompile<cr>", "Compile"},
        i = {"<cmd>PackerInstall<cr>", "Install"},
        r = {"<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile"},
        s = {"<cmd>PackerSync<cr>", "Sync"},
        S = {"<cmd>PackerStatus<cr>", "Status"},
        u = {"<cmd>PackerUpdate<cr>", "Update"}
    },

    d = {
        name = "+Diagnostics",
        t = {"<cmd>TroubleToggle<cr>", "trouble"},
        w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
        d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
        l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
        r = {"<cmd>TroubleToggle lsp_references<cr>", "references"}
    },

    D = {
        name = "+Debug",
        b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
        c = {"<cmd>DebugContinue<cr>", "Continue"},
        i = {"<cmd>DebugStepInto<cr>", "Step Into"},
        o = {"<cmd>DebugStepOver<cr>", "Step Over"},
        r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
        s = {"<cmd>DebugStart<cr>", "Start"}
    },

    g = {
        name = "+Git",
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Git blame<cr>", "Open blame window"},
        B = {"<cmd>GitBlameToggle<cr>", "Toggle blame on current line"},
        w = {"<cmd>GBrowse<cr>", "Open in git browser"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"},
        a = {"<cmd>Telescope git_branches<cr>", "Checkout branch"}
    },

    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics toggle"},
        D = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics toggle"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"},
        n = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic"},
        N = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic"},
        R = {"<cmd>lua require'lint'.try_lint()<cr>", "Load Revive (nvim-lint)"}
    },

    s = {
        name = "+Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope diagnostics<cr>", "Document Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
    S = {name = "+Session", s = {"<cmd>SessionSave<cr>", "Save Session"}, l = {"<cmd>SessionLoad<cr>", "Load Session"}},
    p = {
        name = "+Plz | Project",
        b = {"<cmd>term plz build<cr>", "plz build"},
        t = {"<cmd>term plz test<cr>", "plz test"},
        v = {"<cmd>:Lexplore<cr>", "Open netrw file browser"}
    },

    T = {
        name = "Trouble",
        q = {"<cmd>TroubleToggle quickfix<cr>", "Quickfix list toggle"},
        d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics toggle"},
        w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics toggle"},
        n = {"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "Next"},
        p = {"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "Previous"},
    },

    t = {
        name = "Telescope",
        r = {"<cmd>Telescope resume<cr>", "Resume"},
        f = {
            name = "Find",
            f = {"<cmd>Telescope find_files<cr>", "Find File"},
            s = {"<cmd>Telescope grep_string<cr>", "Find String Under Cursor"},
            g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep"},
            b = {"<cmd>Telescope buffers<cr>", "Find Buffers"},
            h = {"<cmd>Telescope help_tags<cr>", "Find Help Tags"},
            c = {"<cmd>Telescope command_history<cr>", "List Commands That Were Executed"},
            q = {"<cmd>Telescope quickfix<cr>", "List Items In The Quikcfix List"},
        },
        l = {
            name = "Lsp",
            r = {"<cmd>Telescope lsp_references<cr>", "References for word under cursor"},
            c = {"<cmd>Telescope lsp_code_actions<cr>", "Code Actions for word under cursor"},
            i = {"<cmd>Telescope lsp_implementations<cr>", "GoTo Implementation"},
            d = {"<cmd>Telescope lsp_definitions<cr>", "GoTo Definition"},
        },
        t = {
            name = "Treesitter",
            t = {"<cmd>Telescope treesitter<cr>", "List Function names, variables, from Treesitter"},
        },
    },

    q = {
        name = "Quickfix List",
        n = {"<cmd>cn<cr>", "Next"},
        p = {"<cmd>cp<cr>", "Previous"},
        c = {"<cmd>cclose<cr>", "Close"},
        o = {"<cmd>copen<cr>", "Open"},
    },
    h = {
        name = "Harpoon",
        o = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open"},
        c = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Close"},
    },
    c = {
        name = "Copilot",
        o = {"<cmd>Copilot panel<cr>", "Open copliot panel"},
    },
}

local wk = require("which-key")
wk.register(mappings, opts)
wk.register(vmappings, vopts)
