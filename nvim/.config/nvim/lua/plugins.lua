-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

-- TODO add:
-- easyclip,
-- set up quickfix list <ctrl q> with telescope
-- set up telescope to search project
-- and add stuff to which-key
local use = require('packer').use
require('packer').startup(function()
    use {"nvim-lua/plenary.nvim"}

    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"
    -- use {"wbthomason/packer.nvim", event = "VimEnter"}

    use {"neovim/nvim-lspconfig"}
    use {"glepnir/lspsaga.nvim"}
    use {"kabouzeid/nvim-lspinstall"}
    use {"folke/trouble.nvim"}

    -- Debugging
    use {"mfussenegger/nvim-dap"}

    -- Autocomplete
    -- 
    use {"onsails/lspkind-nvim"} -- vscode-like pictograms for cmp

    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp")
        end
    }

    -- must declare these sources in the cmp config file
    -- TODO get a calculator cmp
    -- TODO get a spelling cmp
    use {"hrsh7th/cmp-buffer"}
    use {"hrsh7th/cmp-path"}
    use {"hrsh7th/cmp-nvim-lua"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"David-Kunz/cmp-npm", requires = {'nvim-lua/plenary.nvim'}}
    -- TODO maybe have this ripgrep the whole project rather than just cwd
    use {"lukas-reineke/cmp-rg"}

    -- TODO use snippet pluign: https://github.com/L3MON4D3/LuaSnip
    -- TODO and then use https://github.com/saadparwaiz1/cmp_luasnip to have cmp work with snippets
    -- or use ultisnips, or snippy, or vsnip. tjdevries uses luasnip. ultisnips seems to be more supported in vim
    -- TODO when a snippet completes then we should have a keybinding for jumping between the values for filling it out

    use {"hrsh7th/vim-vsnip"}
    use {"rafamadriz/friendly-snippets"}

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end
    }
    use {"windwp/nvim-ts-autotag"}
    use {
        'andymass/vim-matchup',
        config = function()
            require("config.matchup")
        end
    }
    -- show you which function you're looking at at the top of the screen
    use {"romgrk/nvim-treesitter-context"}
    -- make matching parens and stuff different colors
    use {"p00f/nvim-ts-rainbow"}
    -- makes extra pairs that work with %
    use {"theHamsta/nvim-treesitter-pairs"}
    -- auto highlight the current word
    use {"RRethy/vim-illuminate"}

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end
    }
    use {"f-person/git-blame.nvim"}
    use {
        "folke/which-key.nvim",
        config = function()
            require("config.which-key")
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs")
        end
    }
    use {"kevinhwang91/nvim-bqf"}

    -- Comments
    use {"tpope/vim-commentary"}
    use {'JoosepAlviste/nvim-ts-context-commentstring'}

    use {"lukas-reineke/indent-blankline.nvim", after = "material.nvim"}

    use {
        "marko-cerovac/material.nvim",
        config = function()
            require("config.material")
        end
    }

    use {"kyazdani42/nvim-web-devicons"}

    -- Status Line and Bufferline
    use {
        "glepnir/galaxyline.nvim",
        config = function()
            require("config.galaxyline")
        end
    }
    use {
        "romgrk/barbar.nvim",
        config = function()
            require("config.barbar")
        end
    }

    -- Formatter
    use {"sbdchd/neoformat"}
    use {"tpope/vim-sleuth"}
    use {"tpope/vim-repeat"}
    use {
        "editorconfig/editorconfig-vim",
        config = function()
            require("config.editorconfig")
        end
    }
    use {"tpope/vim-fugitive"}
    use {
        "shumphrey/fugitive-gitlab.vim",
        config = function()
            require("config.fugitive")
        end
    }
    use {"tpope/vim-rhubarb"}
    -- TODO vim-go is messing with nvim-lint i think. taking forever to save
    -- the snippets in vim-go are good. also implementing a interface with lsp is nice
    -- use {
    --     'fatih/vim-go',
    --     config = function()
    --         vim.g.syntastic_go_checkers = {}
    --         vim.g.go_fmt_command = ""
    --     end
    -- }
    -- TODO could look into getting this to work instead
    -- use {"~/go/pkg/mod/github.com/zchee/nvim-go@v0.3.0/plugin/nvim-go.vim", opt = true, run = "make"}
    use {
        "mfussenegger/nvim-lint",
        config = function()
            require("config.lint")
        end
    }

    use {"github/copilot.vim"}

    -- use {"svermeulen/vim-easyclip", opt = true}

    -- Speed up Neovim startup time.
    use 'lewis6991/impatient.nvim'
    ---- Also speed up Neovim startup time.
    -- TODO get my file types to work with this that are set in vimrc
    use("nathom/filetype.nvim")
end)
