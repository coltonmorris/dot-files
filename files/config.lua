
-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "material"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.matchup.enabled = true
lvim.builtin.treesitter.matchup = {
  enable = true,
  config = {
    css = '// %s'
  }
}
lvim.builtin.treesitter.incremental_selection = {
  enable = true,
  -- TODO try these out
  keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
  }
}
lvim.builtin.treesitter.textobjects.enabled = true
lvim.builtin.treesitter.pairs = {
  enable = true,
  disable = {},
  highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
  highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
  goto_right_end = false, -- whether to go to the end of the right partner or the beginning
  fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
  keymaps = {
          goto_partner = "<leader>%"
  }
}
lvim.builtin.treesitter.rainbow = {
  enable = true,
  extended_mode = true,
  max_file_lines = 1000,
}
lvim.builtin.treesitter.indent.enabled = true
lvim.builtin.treesitter.autotag.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- {
--   "abecodes/tabout.nvim",
--   config = function()
--     require("user.tabout").config()
--   end,
--   wants = { "nvim-treesitter" }, -- or require if not used so far
--   after = { "nvim-cmp", "LuaSnip" }, -- if a completion plugin is using tabs load it before
-- },

-- TODO configs for: which-key, nvim-lint, lv-material, lv-indent-blankline, lv-galaxyline, lv-fugitive-gitlab, lveditorconfig-vim, lv-autocommands, lsp/init.lua

  -- show you which function you're looking at at the top of the screen
  {"romgrk/nvim-treesitter-context"},
  -- make matching parens and stuff different colors
  {"p00f/nvim-ts-rainbow"},
  -- makes extra pairs that work with %
  {"theHamsta/nvim-treesitter-pairs"},
  -- auto highlight the current word
  {"RRethy/vim-illuminate"},

  {"marko-cerovac/material.nvim", config = function()
    require('material').setup({
      borders = true,
      italics = {
        comments = true,
      },
    })
      vim.g.material_style = "lighter"
      vim.cmd('set background=light')
  end},

  -- TODO get working
  -- must be after material.vim, also use branch lua
  -- {"Lukas-reineke/indent-blankline.nvim", after = {"marko-cerovac/material.vim",},},
  {"editorconfig/editorconfig-vim"},
  {"mfussenegger/nvim-lint", config = function()
    local nvim_lint = require'lint'

    nvim_lint.linters.revive.args = {'-config', '/Users/colton/gomod/git.tcncloud.net/m/neo/config.toml'}

    nvim_lint.linters_by_ft = {
        go = {'revive'},
    }

    -- TODO this is nice becuase it enables list for any filetype used by this linter, but right now we just put it in custom_groups autocommand
    -- run the linter on files that are defined
    -- function enable_lint()
    --   if not nvim_lint.linters_by_ft[vim.bo.filetype] then
    --     return
    --   end
    --   local bufnr = vim.api.nvim_get_current_buf()
    --   vim.cmd(string.format("augroup lint_%d", bufnr))
    --   vim.cmd("au!")
    --   vim.cmd(string.format("au ColorScheme <buffer=%d> lua require'lint'.try_lint()", bufnr))
    --   vim.cmd(string.format("au BufReadPre <buffer=%d> lua require'lint'.try_lint()", bufnr))
    --   vim.cmd(string.format("au BufWritePost <buffer=%d> lua require'lint'.try_lint()", bufnr))
    --   vim.cmd(string.format("au BufEnter <buffer=%d> lua require'lint'.try_lint()", bufnr))
    --   vim.cmd("augroup end")
    --   local opts = {
    --     silent = true;
    --   }
    -- end
    -- enable_lint()
  end},

  {"tpope/vim-sleuth"},
  {"tpope/vim-repeat"},
  -- needed for :Gbrowse
  {"tpope/vim-fugitive"},
  -- needed for :Gbrowse. requires setup (echo 'machine api.github.com login <user> password <token>' >> ~/.netrc)
  {"tpope/vim-rhubarb"},
}



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  { "ColorScheme", "*.go", "lua require'lint'.try_lint()" },
  { "BufReadPre", "*.go", "lua require'lint'.try_lint()" },
  { "BufWritePost", "*.go", "lua require'lint'.try_lint()" },
  { "BufEnter", "*.go", "lua require'lint'.try_lint()" },
}
