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

    win = {
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

-- NOTE: <cmd> puts you back in normal-mode.
    --    :    keeps you in visual mode
    -- see https://neovim.io/doc/user/map.html#:map-cmd

-- local vmappings = {
--     a = {
--         name = "AI",
--         i = {"<cmd>ChatGPTEditWithInstructions<cr>", "edit selected text or whole window using the code-davinci-edit-002 model (GPT 3.5 fine-tuned for coding)."},
--         g = {"<cmd>ChatGPTRun grammar_correction<cr>", "use gpt 3.5 to correct grammar"},
--         o = {"<cmd>ChatGPT<cr>", "opens interactive window for chatGPT"},
--         t = {"<cmd>ChatGPTRun add_tests<cr>", "write tests for your code using gpt 3.5"},
--     },
-- 
--     ["/"] = {"<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment"},
--     ["w"] = {"<cmd>GBrowse<cr>", "Gbrowse"},
--     ["b"] = {"<cmd>GBrowse<cr>", "Gbrowse"},
-- }

local vmappings = {
      mode = { "v" },
      { "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", desc = "Comment", nowait = true, remap = false },
      { "<leader>a", group = "AI", nowait = true, remap = false },
      { "<leader>ag", "<cmd>ChatGPTRun grammar_correction<cr>", desc = "use gpt 3.5 to correct grammar", nowait = true, remap = false },
      { "<leader>ai", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "edit selected text or whole window using the code-davinci-edit-002 model (GPT 3.5 fine-tuned for coding).", nowait = true, remap = false },
      { "<leader>ao", "<cmd>ChatGPT<cr>", desc = "opens interactive window for chatGPT", nowait = true, remap = false },
      { "<leader>at", "<cmd>ChatGPTRun add_tests<cr>", desc = "write tests for your code using gpt 3.5", nowait = true, remap = false },
      { "<leader>b", "<cmd>GBrowse<cr>", desc = "Gbrowse", nowait = true, remap = false },
      { "<leader>w", "<cmd>GBrowse<cr>", desc = "Gbrowse", nowait = true, remap = false },
}

local mappings = {
    { "<leader>D", group = "Database", nowait = false, remap = false },
        { "<leader>Do", '<cmd>:terminal kubectl port-forward $(kubectl get pods -l=app=matrix-db-cloudsql -o jsonpath="{.items[0].metadata.name}") 5432:5432 <cr> :DBUI <cr> ', desc = "Open dev db", nowait = false, remap = false },

    { "<leader>G", group = "Git", nowait = false, remap = false },
        { "<leader>GB", "<cmd>GitBlameToggle<cr>", desc = "Toggle blame on current line", nowait = false, remap = false },
        { "<leader>GC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)", nowait = false, remap = false },
        { "<leader>GR", "<cmd>ResetBuffer<cr>", desc = "Reset Buffer", nowait = false, remap = false },
        { "<leader>Ga", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = false, remap = false },
        { "<leader>Gb", "<cmd>Git blame<cr>", desc = "Open blame window", nowait = false, remap = false },
        { "<leader>Gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = false, remap = false },
        { "<leader>Gj", "<cmd>NextHunk<cr>", desc = "Next Hunk", nowait = false, remap = false },
        { "<leader>Gk", "<cmd>PrevHunk<cr>", desc = "Prev Hunk", nowait = false, remap = false },
        { "<leader>Go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = false, remap = false },
        { "<leader>Gp", "<cmd>PreviewHunk<cr>", desc = "Preview Hunk", nowait = false, remap = false },
        { "<leader>Gr", "<cmd>ResetHunk<cr>", desc = "Reset Hunk", nowait = false, remap = false },
        { "<leader>Gs", "<cmd>StageHunk<cr>", desc = "Stage Hunk", nowait = false, remap = false },
        { "<leader>Gu", "<cmd>UndoStageHunk<cr>", desc = "Undo Stage Hunk", nowait = false, remap = false },
        { "<leader>Gw", "<cmd>GBrowse<cr>", desc = "Open in git browser", nowait = false, remap = false },

    { "<leader>H", ":set hlsearch!<cr>", desc = "No Highlight", nowait = false, remap = false },

    { "<leader>P", group = "Packer", nowait = false, remap = false },
        { "<leader>PS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = false, remap = false },
        { "<leader>Pc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = false, remap = false },
        { "<leader>Pi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = false, remap = false },
        { "<leader>Pr", "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", desc = "Re-compile", nowait = false, remap = false },
        { "<leader>Ps", "<cmd>PackerSync<cr>", desc = "Sync", nowait = false, remap = false },
        { "<leader>Pu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = false, remap = false },

    { "<leader>S", group = "Session", nowait = false, remap = false },
        { "<leader>Sl", "<cmd>SessionLoad<cr>", desc = "Load Session", nowait = false, remap = false },
        { "<leader>Ss", "<cmd>SessionSave<cr>", desc = "Save Session", nowait = false, remap = false },

    { "<leader>a", group = "AI", nowait = false, remap = false },
        { "<leader>ag", "<cmd>ChatGPTRun grammar_correction<cr>", desc = "use gpt 3.5 to correct grammar", nowait = false, remap = false },
        { "<leader>ai", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "edit selected text or whole window using the code-davinci-edit-002 model (GPT 3.5 fine-tuned for coding).", nowait = false, remap = false },
        { "<leader>ao", "<cmd>ChatGPT<cr>", desc = "opens interactive window using the gpt-3.5-turbo model", nowait = false, remap = false },
        { "<leader>at", "<cmd>ChatGPTRun add_tests<cr>", desc = "write tests for your code using gpt 3.5", nowait = false, remap = false },

    { "<leader>b", group = "Buffers", nowait = false, remap = false },
        { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory", nowait = false, remap = false },
        { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language", nowait = false, remap = false },
        { "<leader>bc", "<cmd>BufferClose<cr>", desc = "Close", nowait = false, remap = false },
        { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close", nowait = false, remap = false },
        { "<leader>bl", "<cmd>BufferCloseBuffersLeft<cr>", desc = "Close all to the left", nowait = false, remap = false },
        { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous", nowait = false, remap = false },
        { "<leader>br", "<cmd>BufferCloseBuffersRight<cr>", desc = "Close all to the right", nowait = false, remap = false },

    { "<leader>c", group = "Copilot", nowait = false, remap = false },
        { "<leader>co", "<cmd>Copilot panel<cr>", desc = "Open copliot panel", nowait = false, remap = false },

    { "<leader>d", group = "Diagnostics", nowait = false, remap = false },
        { "<leader>dN", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previous Diagnostic", nowait = false, remap = false },
        { "<leader>dg", "<cmd>Telescope diagnostics<cr>", desc = "Telescope Document Diagnostics", nowait = false, remap = false },
        { "<leader>dh", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Hover Diagnostic", nowait = false, remap = false },
        { "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic", nowait = false, remap = false },
        { "<leader>dq", "<cmd>lua vim.diagnostic.setqflist()<cr>", desc = "Quickfix Diagnostics", nowait = false, remap = false },

    { "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Type Information. Hover LSP", nowait = false, remap = false },

    { "<leader>l", group = "LSP", nowait = false, remap = false },
        { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go To Declaration", nowait = false, remap = false },
        { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Info", nowait = false, remap = false },
        { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References", nowait = false, remap = false },
        { "<leader>lS", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", nowait = false, remap = false },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = false, remap = false },
        { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go To Definition", nowait = false, remap = false },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", desc = "Format", nowait = false, remap = false },
        { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Type Information", nowait = false, remap = false },
        { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation", nowait = false, remap = false },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = false, remap = false },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = false, remap = false },
        { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition", nowait = false, remap = false },
        { "<leader>lv", "<cmd>lua require'lint'.try_lint()<cr>", desc = "Load Revive (nvim-lint)", nowait = false, remap = false },

    { "<leader>lw", group = "Workspace", nowait = false, remap = false },
        { "<leader>lwW", "<cmd>lua vim.lsp.buf.remove_workspace_folders()<cr>", desc = "Remove Workspace Folder", nowait = false, remap = false },
        { "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Workspace Folders", nowait = false, remap = false },
        { "<leader>lww", "<cmd>lua vim.lsp.buf.add_workspace_folders()<cr>", desc = "Add Workspace Folder", nowait = false, remap = false },

    { "<leader>q", group = "Quickfix List", nowait = false, remap = false },
        { "<leader>qc", "<cmd>cclose<cr>", desc = "Close", nowait = false, remap = false },
        { "<leader>qn", "<cmd>cn<cr>", desc = "Next", nowait = false, remap = false },
        { "<leader>qo", "<cmd>copen<cr>", desc = "Open", nowait = false, remap = false },
        { "<leader>qp", "<cmd>cp<cr>", desc = "Previous", nowait = false, remap = false },
        { "<leader>qq", "<cmd>cdo g//norm @q <cr>", desc = "Run @q macro on quickfix list", nowait = false, remap = false },
        { "<leader>qv", "<cmd>vopen<cr>", desc = "Open item in vertical split", nowait = false, remap = false },

    { "<leader>s", group = "Search", nowait = false, remap = false },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = false, remap = false },
        { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = false, remap = false },
        { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = false, remap = false },
        { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = false, remap = false },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Document Diagnostics", nowait = false, remap = false },
        { "<leader>sf", "<cmd>Telescope find_files <cr>", desc = "Find File", nowait = false, remap = false },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks", nowait = false, remap = false },
        { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = false, remap = false },
        { "<leader>st", "<cmd>Telescope live_grep <cr>", desc = "Text", nowait = false, remap = false },

    { "<leader>t", group = "Telescope", nowait = false, remap = false },
        { "<leader>f", "<cmd>Telescope find_files <cr>", desc = "Find File", nowait = false, remap = false },
        { "<leader>g", "<cmd>Telescope live_grep <cr>", desc = "Grep String", nowait = false, remap = false },
        { "<leader>tf", group = "Find", nowait = false, remap = false },
        { "<leader>tfb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers", nowait = false, remap = false },
        { "<leader>tfc", "<cmd>Telescope command_history<cr>", desc = "List Commands That Were Executed", nowait = false, remap = false },
        { "<leader>tff", "<cmd>Telescope find_files <cr>", desc = "Find File", nowait = false, remap = false },
        { "<leader>tfg", "<cmd>Telescope live_grep <cr>", desc = "Live Grep", nowait = false, remap = false },
        { "<leader>tfh", "<cmd>Telescope help_tags<cr>", desc = "Find Help Tags", nowait = false, remap = false },
        { "<leader>tfq", "<cmd>Telescope quickfix<cr>", desc = "List Items In The Quikcfix List", nowait = false, remap = false },
        { "<leader>tfs", "<cmd>Telescope grep_string<cr>", desc = "Find String Under Cursor", nowait = false, remap = false },
        { "<leader>tr", "<cmd>Telescope resume<cr>", desc = "Resume", nowait = false, remap = false },
        { "<leader>tt", group = "Treesitter", nowait = false, remap = false },
        { "<leader>ttt", "<cmd>Telescope treesitter<cr>", desc = "List Function names, variables, from Treesitter", nowait = false, remap = false },

    { "<leader>z", group = "Spelling", nowait = false, remap = false },
        { "<leader>za", "zg", desc = "Add word", nowait = false, remap = false },
        { "<leader>zf", "1z=", desc = "Use 1. correction", nowait = false, remap = false },
        { "<leader>zl", "<cmd>Telescope spell_suggest<cr>", desc = "List corrections", nowait = false, remap = false },
        { "<leader>zn", "]s", desc = "Next", nowait = false, remap = false },
        { "<leader>zp", "[s", desc = "Previous", nowait = false, remap = false },
}


local wk = require("which-key")
wk.register(mappings, opts)
wk.register(vmappings, vopts)
