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
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        yamlreact = { "prettierd", "prettier" },
        php = { "pint" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
    },
    log_level = vim.log.levels.WARN,
    formatters = {
        pint = {
            -- This can be a string or a function that returns a string
            command = vim.fn.stdpath("data") .. "/mason/bin/pint",
            -- OPTIONAL - all fields below this are optional
            -- A list of strings, or a function that returns a list of strings
            -- Return a single string instead to run the command in a shell
            args = { "$FILENAME" },
            -- A function that calculates the directory to run the command in
            cwd = require("conform.util").root_file({
                ".editorconfig",
                "composer.json",
                "package.json",
            }),
            stdin = false,
        },
    },
})

vim.keymap.set("n", "<leader>vf", function()
    conform.format({
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
    })
end)
