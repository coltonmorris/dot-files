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

local packer = require("packer")
local use = packer.use
packer.init({
    luarocks = {
        python = { "python3" },
    },
})

packer.startup(function()
    use {"nvim-lua/plenary.nvim"}

    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    use "MunifTanjim/nui.nvim"


    -- fatih/vim-go was too slow, and this is basically feature parity. failed to get zchee/nvim-go to work
    use {
        "ray-x/go.nvim",
        config = function()
            require("go").setup()
        end
    }
    use {"ray-x/guihua.lua"}

    use {
        "OXY2DEV/markview.nvim",
        config = function() 
            require("markview").setup({})
        end
    }

    -- configurations are done in config/lsp/init.lua
    use { "neovim/nvim-lspconfig", }
    -- TODO use mason instead
    use {"williamboman/nvim-lsp-installer"}
    use {"onsails/lspkind-nvim"} -- vscode-like pictograms for cmp
    use {
        -- TODO look into using hrsh7th/cmp-nvim-lsp-signature-help instead, will have no overlap of windows
        "ray-x/lsp_signature.nvim",
        config = function()
            require("config.signature")
        end
    }

    -- rust stuff
    use {"simrat39/rust-tools.nvim"}

    use {"nvimtools/none-ls.nvim",
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope.nvim'},
        },
        config = function()
        require("config.null-ls")
        end
    }

    -- Debugging
    use {"mfussenegger/nvim-dap"}

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim'},
        },
        config = function()
            require("config.telescope")
        end
    }

    -- -- A nice project plugin, lets you switch between projects and changes $CWD
    -- use {
    --     'charludo/projectmgr.nvim',
    --     rocks = {'lsqlite3complete'},
    --     config = function()
    --         require("config.project")
    --     end
    -- }

    -- TODO i think this is breaking things
    -- gives the quickfix list a lot of functionality. Initially used to open items in vertical splits
    use { "yssl/QFEnter" }

    -- TODO use the terminal related commands
    use {'ThePrimeagen/harpoon',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope.nvim'},
        },
    }

    -- auto adjust window splits
    use { "beauwilliams/focus.nvim",
        config = function()
            require("focus").setup()
        end
    }

    -- TODO why not working?
    -- surround words with characters: sa{motion}{char} 
    -- replace surrounding characters: sr<from><to>
    -- delete surrounding characters: sd<char>
    -- cycle surrounding quotes: stq
    -- cycle surrounding brackets: stb
    use { "ur4ltz/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "sandwhich"}
        end
    }

    -- Autocomplete
    -- must declare these sources in the cmp config file
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp")
        end,
        -- wants = { "LuaSnip" },
        -- requires = {
        --     {
        --         "L3MON4D3/LuaSnip",
        --         event = "BufReadPre",
        --         wants = "friendly-snippets",
        --         requires = {
        --             "rafamadriz/friendly-snippets",
        --             "luasnip_snippets.nvim",
        --         }
        --     }
        -- },
        -- TODO this event line causes the plugin to be optional?
        -- event = "InsertEnter",
    }

    use {"hrsh7th/cmp-nvim-lsp-signature-help"}
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    }

    use {"hrsh7th/cmp-buffer"}
    use {"hrsh7th/cmp-path"}
    use {"hrsh7th/cmp-nvim-lua"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-calc"}
    use {"f3fora/cmp-spell"}
    -- not a huge fan of this one
    -- use {"hrsh7th/cmp-cmdline"}
    use {"hrsh7th/cmp-emoji"}
    use {"David-Kunz/cmp-npm", requires = {'nvim-lua/plenary.nvim'}}
    -- TODO maybe have this ripgrep the whole project rather than just cwd
    -- TODO dont think this is working
    use {"lukas-reineke/cmp-rg"}

    use {"rafamadriz/friendly-snippets"}
    use {"molleweide/LuaSnip-snippets.nvim"}
    -- TODO when a snippet completes then we should have a keybinding for jumping between the values for filling it out
    use {"L3MON4D3/LuaSnip", 
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require("config.luasnip")
        end
    }
    use {"saadparwaiz1/cmp_luasnip"}

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end,
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }
    use {"nvim-treesitter/playground"}


    -- HTML auto close and auto rename tags
    use {"windwp/nvim-ts-autotag"}
    -- extends the percent sign % to work with more objects
    use {
        'andymass/vim-matchup',
        config = function()
            require("config.matchup")
        end
    }
    -- sets the comment string based on treesitter queries
    use {'JoosepAlviste/nvim-ts-context-commentstring'}
    -- show you which function you're looking at at the top of the screen
    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require("config.treesitter-context")
        end
    }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    -- make matching parens and stuff different colors
    use {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("config.rainbow-delimiters")
        end
    }
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

    -- Comments with treesitter support
    use {'terrortylor/nvim-comment',
        config = function()
            require("config.comment")
        end
    }

    use {"lukas-reineke/indent-blankline.nvim", after = "material.nvim"}

    use {
        "marko-cerovac/material.nvim",
        config = function()
            require("config.material")
        end,
        after = {
            "lualine.nvim",
            "nvim-treesitter",
        },
    }

--    use {
--        'Tsuzat/NeoSolarized.nvim',
--        config = function()
--            -- require("config.solarized")
--        end,
--    }

    use { 'norcalli/nvim-colorizer.lua',
        config = function()
            require("config.colorizer")
        end,
    }

    use {"kyazdani42/nvim-web-devicons"}

    -- Status Line and Bufferline
    use {
        "nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons'},
        config = function()
            require("config.lualine")
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
    -- used for :GBrowse. Can also use omni-complete in commit messages <C-X><C-O>
    use {"tpope/vim-rhubarb"}

    use {
        "mfussenegger/nvim-lint",
        config = function()
            require("config.lint")
        end
    }

    use {
        "codethread/qmk.nvim",
        config = function()
            require("config.qmk")
        end
    }

    
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("config.copilot")
        end,
    }

    use {
        "frankroeder/parrot.nvim",
        config = function()
            require("parrot").setup({
                providers = {
                    openai = {
                        api_key = os.getenv("OPENAI_API_KEY"),
                        models = {
                            "o3-mini",
                        },
                    },
                },
                -- chat_free_cursor = true,
                command_auto_select_response = false,
                -- chat_prompt_buf_type = true,
                -- toggle_target = "popup",
            })
        end
    }

    use {
        "RaafatTurki/hex.nvim",
        config = function()
            require 'hex'.setup()
        end,
    }

    -- database plugin, will need an env set:
    --      export DBUI_URL="postgres://omni:password@localhost:5432/omni"
    use {"tpope/vim-dadbod"}
    use {"kristijanhusak/vim-dadbod-ui"}

    -- Speed up Neovim startup time.
    use 'lewis6991/impatient.nvim'
    -- run :StartupTime to see how long it takes to load plugins
    use 'dstein64/vim-startuptime'
end)
