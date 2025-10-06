return {

    -- Installer

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        priority = 999,
        lazy = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "astro",
                    -- "dartls",
                    "emmet_ls",
                    "gopls",
                    "html",
                    "intelephense",
                    "jsonls",
                    "lua_ls",
                    "rust_analyzer",
                    "tailwindcss",
                    "ts_ls",
                    "yamlls",
                    "vue_ls",
                    "vtsls",
                    "prismals",
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
