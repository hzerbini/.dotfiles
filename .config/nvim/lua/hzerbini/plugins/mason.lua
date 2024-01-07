return {

    -- Installer

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        lazy = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "emmet_ls",
                    "gopls",
                    "intelephense",
                    "lua_ls",
                    "rust_analyzer",
                    "tailwindcss",
                    "tsserver",
                    "yamlls",
                },
            })
        end,
        lazy = false,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "blade-formatter",
                    "delve",
                    "eslint_d",
                    "js-debug-adapter",
                    "php-debug-adapter",
                    "phpcs",
                    "pint",
                    "prettier",
                    "prettierd",
                    "stylua",
                },
            })
        end,
        lazy = false,
    },
}