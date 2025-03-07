return {
    "mfussenegger/nvim-lint",
    event = "BufEnter",
    config = function()
        require("lint").linters_by_ft = {
            astro = { "eslint_d" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            vue = { "eslint_d" },
            -- php = { "phpcs" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
