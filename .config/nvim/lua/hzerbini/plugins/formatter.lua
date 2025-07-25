return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            local conform = require("conform")
            local slow_format_filetypes = {}
            conform.formatters.inject = {}

            conform.setup({
                formatters_by_ft = {
                    -- Use a sub-list to run only the first available formatter
                    astro = { "prettier" },
                    blade = { "blade-formatter" },
                    css = { "prettier" },
                    html = { "prettier" },
                    javascript = { "prettier" },
                    javascriptreact = { "prettier" },
                    json = { "prettier" },
                    lua = { "stylua" },
                    markdown = { "prettier" },
                    php = { "pint" },
                    typescript = { "eslint_d", "prettier" },
                    typescriptreact = { "eslint_d", "prettier" },
                    vue = { "eslint_d", "prettier" },
                    yaml = { "prettier" },
                    yamlreact = { "prettier" },
                },
                -- format_on_save = function(bufnr)
                --     if slow_format_filetypes[vim.bo[bufnr].filetype] then
                --         return
                --     end
                --     local function on_format(err)
                --         if err and err:match("timeout$") then
                --             slow_format_filetypes[vim.bo[bufnr].filetype] = true
                --         end
                --     end
                --
                --     return { timeout_ms = 200, lsp_fallback = false }, on_format
                -- end,
                --
                -- format_after_save = function(bufnr)
                --     if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                --         return
                --     end
                --     return { lsp_fallback = true }
                -- end,
                log_level = vim.log.levels.TRACE,
                notify_on_error = true,
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
                    ["blade-formatter"] = {
                        -- This can be a string or a function that returns a string
                        command = vim.fn.stdpath("data") .. "/mason/bin/blade-formatter",
                        -- OPTIONAL - all fields below this are optional
                        -- A list of strings, or a function that returns a list of strings
                        -- Return a single string instead to run the command in a shell
                        args = { "--write", "$FILENAME" },
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
            --
        end,
        keys = {
            {
                "<leader>vf",
                function()
                    require("conform").format({
                        lsp_fallback = true,
                        async = true,
                    })
                end,
            },
        },
    },
}
