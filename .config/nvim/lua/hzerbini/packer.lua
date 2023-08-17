-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('tpope/vim-unimpaired')

    -- Telemetry
    use('ActivityWatch/aw-watcher-vim')

    use('nvim-telescope/telescope-file-browser.nvim')
    use('ThePrimeagen/git-worktree.nvim')

    use 'shaunsingh/nord.nvim'
    use {
        'nvim-lualine/lualine.nvim',
    }

    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('Wansmer/treesj')

    use('tpope/vim-commentary')
    use('kylechui/nvim-surround')
    use('github/copilot.vim')

    use {
        "folke/trouble.nvim"
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Test Configuration
    use('nvim-neotest/neotest')
    use('nvim-neotest/neotest-go')
    use('nvim-neotest/neotest-plenary')
    use('olimorris/neotest-phpunit')

    -- LInter and Formatter
    use('jose-elias-alvarez/null-ls.nvim')

    use('mfussenegger/nvim-dap')
    use('rcarriga/nvim-dap-ui')
    use('theHamsta/nvim-dap-virtual-text')
    use('nvim-telescope/telescope-dap.nvim')

    use("folke/zen-mode.nvim")
    use("eandrju/cellular-automaton.nvim")

    -- Web icons
    use('nvim-tree/nvim-web-devicons')

end)

