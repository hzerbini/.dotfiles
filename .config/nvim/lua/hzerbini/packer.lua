-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use("tpope/vim-unimpaired")

    -- Telemetry
    use("ActivityWatch/aw-watcher-vim")

    use("nvim-telescope/telescope-file-browser.nvim")
    use("ThePrimeagen/git-worktree.nvim")

    use("shaunsingh/nord.nvim")
    use({
        "nvim-lualine/lualine.nvim",
    })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    use("Wansmer/treesj")

    use("numToStr/Comment.nvim")
    use("kylechui/nvim-surround")

    use("folke/trouble.nvim")

    -- A.I Helper
    use("Exafunction/codeium.vim")

    -- Database
    use("tpope/vim-dadbod")
    use("kristijanhusak/vim-dadbod-ui")
    use("kristijanhusak/vim-dadbod-completion")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-path")
    use("f3fora/cmp-spell")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("jcha0713/cmp-tw2css")
    use("onsails/lspkind.nvim")

    -- LSP Language Specific
    use("folke/neodev.nvim")

    -- Linter
    use("mfussenegger/nvim-lint")

    -- Formatter
    use("stevearc/conform.nvim")

    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "maje install_jsregexp",
    })
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- Installer
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("WhoIsSethDaniel/mason-tool-installer.nvim")

    -- Test Configuration
    use("nvim-neotest/neotest")
    use("nvim-neotest/neotest-go")
    use("nvim-neotest/neotest-plenary")
    use("olimorris/neotest-phpunit")

    -- DAP
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("leoluz/nvim-dap-go")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")

    use("folke/zen-mode.nvim")
    use("eandrju/cellular-automaton.nvim")

    -- Web icons
    use("nvim-tree/nvim-web-devicons")

    -- Colors
    use("norcalli/nvim-colorizer.lua")
end)
