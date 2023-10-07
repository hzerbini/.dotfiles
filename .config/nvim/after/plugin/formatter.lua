local conform = require("conform")
require("mason-tool-installer").setup({
    ensure_installed = {
        "prettierd",
        "prettier",
        "stylua",
        "blade-formatter",
    },
})

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- blade = { "blade-formatter" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
    },
})

vim.keymap.set("n", "<leader>vf", function()
    print("formatting")
    conform.format({
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
    })
end)
