local utils = require("../utils")

require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },

    window = {
        border = "double", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },

    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
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

-- NOTE: <cmd> puts you back in normal-mode.
    --    :    keeps you in visual mode
    -- see https://neovim.io/doc/user/map.html#:map-cmd
local vmappings = {
    a = {
        name = "AI",
        i = {"<cmd>ChatGPTEditWithInstructions<cr>", "edit selected text or whole window using the code-davinci-edit-002 model (GPT 3.5 fine-tuned for coding)."},
        g = {"<cmd>ChatGPTRun grammar_correction<cr>", "use gpt 3.5 to correct grammar"},
        o = {"<cmd>ChatGPT<cr>", "opens interactive window for chatGPT"},
        t = {"<cmd>ChatGPTRun add_tests<cr>", "write tests for your code using gpt 3.5"},
    },

    ["/"] = {"<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment"},
    ["w"] = {"<cmd>GBrowse<cr>", "Gbrowse"},
    ["b"] = {"<cmd>GBrowse<cr>", "Gbrowse"},
}

local mappings = {
    a = {
        name = "AI",
        i = {"<cmd>ChatGPTEditWithInstructions<cr>", "edit selected text or whole window using the code-davinci-edit-002 model (GPT 3.5 fine-tuned for coding)."},
        g = {"<cmd>ChatGPTRun grammar_correction<cr>", "use gpt 3.5 to correct grammar"},
        o = {"<cmd>ChatGPT<cr>", "opens interactive window using the gpt-3.5-turbo model"},
        t = {"<cmd>ChatGPTRun add_tests<cr>", "write tests for your code using gpt 3.5"},
    },

    c = {
        name = "Copilot",
        o = {"<cmd>Copilot panel<cr>", "Open copliot panel"},
    },

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

    d = {
        name = "Diagnostics",
        g = {"<cmd>Telescope diagnostics<cr>", "Telescope Document Diagnostics"},
        h = {"<cmd>lua vim.diagnostic.open_float()<cr>", "Hover Diagnostic"},
        n = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic"},
        N = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic"},
        q = {"<cmd>lua vim.diagnostic.setqflist()<cr>", "Quickfix Diagnostics"},
    },
    D = {
        name = "Database",
        -- TODO works for now, the terminal should be a "job", which i guess is a neovim specific thing i can look into. :help job
        o = {"<cmd>:terminal kubectl port-forward $(kubectl get pods -l=app=matrix-db-cloudsql -o jsonpath=\"{.items[0].metadata.name}\") 5432:5432 <cr> :DBUI <cr> ", "Open dev db"},
    },


    -- Use these when setting keymapping elsewhere
    f = {"<cmd>Telescope find_files <cr>", "Find File"},

    g = {"<cmd>Telescope live_grep <cr>", "Grep String"},
    G = {
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


    ["h"] = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Type Information. Hover LSP"},
    H = {":set hlsearch!<cr>", "No Highlight"},

    l = {
        name = "+LSP",
        d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition"},
        D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration"},
        I = {"<cmd>LspInfo<cr>", "Info"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation"},
        a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"},
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
        h = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Type Information"},
        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
        R = {"<cmd>lua vim.lsp.buf.references()<cr>", "References"},
        S = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        t = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition"},
        -- NODE: revive should automatically start, but can manually load if needed
        v = {"<cmd>lua require'lint'.try_lint()<cr>", "Load Revive (nvim-lint)"},
        w = {
            name = "Workspace",
            l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders"},
            -- TODO should populate the function with the paramater for workspace folder
            -- also have no clue wtf this does
            w = {"<cmd>lua vim.lsp.buf.add_workspace_folders()<cr>", "Add Workspace Folder"},
            W = {"<cmd>lua vim.lsp.buf.remove_workspace_folders()<cr>", "Remove Workspace Folder"},
            -- TODO get this working :) the query is bad
            -- x = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"},
        },
    },

    s = {
        name = "+Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope diagnostics<cr>", "Document Diagnostics"},
        f = {"<cmd>Telescope find_files <cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep <cr>", "Text"},
    },
    S = {name = "+Session", s = {"<cmd>SessionSave<cr>", "Save Session"}, l = {"<cmd>SessionLoad<cr>", "Load Session"}},

    p = {
        name = "Plz and Project",
        b = {function() utils.formatFilenameToPlzPath() end, "plz build"},
        t = {"<cmd>top split | resize 20 | term plz test<cr>", "plz test"},
        o = {"<cmd>ProjectMgr<cr>", "Open Project. Press `a` to add a new project."},
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

    t = {
        name = "Telescope",
        r = {"<cmd>Telescope resume<cr>", "Resume"},
        f = {
            name = "Find",
            f = {"<cmd>Telescope find_files <cr>", "Find File"},
            s = {"<cmd>Telescope grep_string<cr>", "Find String Under Cursor"},
            g = {"<cmd>Telescope live_grep <cr>", "Live Grep"},
            b = {"<cmd>Telescope buffers<cr>", "Find Buffers"},
            h = {"<cmd>Telescope help_tags<cr>", "Find Help Tags"},
            c = {"<cmd>Telescope command_history<cr>", "List Commands That Were Executed"},
            q = {"<cmd>Telescope quickfix<cr>", "List Items In The Quikcfix List"},
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
        v = {"<cmd>vopen<cr>", "Open item in vertical split"},
        q = {"<cmd>cdo g//norm @q <cr>", "Run @q macro on quickfix list"}
    },

    z = {
        name = "Spelling",
        n = { "]s", "Next" },
        p = { "[s", "Previous" },
        a = { "zg", "Add word" },
        f = { "1z=", "Use 1. correction" },
        l = { "<cmd>Telescope spell_suggest<cr>", "List corrections" },
    },
}

local wk = require("which-key")
wk.register(mappings, opts)
wk.register(vmappings, vopts)
