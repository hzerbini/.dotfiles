return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- always load the LazyVim library
                "LazyVim",
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "wezterm-types", mods = { "wezterm" } },
            },
            -- Load the wezterm types when the `wezterm` module is required
            -- Needs `justinsgithub/wezterm-types` to be installed
        },
    },
    {

        "neovim/nvim-lspconfig",
        config = function()
            -- Global Mappings -- With Need to Attach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "gd", function()
                        vim.lsp.buf.definition()
                    end, opts)
                    vim.keymap.set("n", "K", function()
                        vim.lsp.buf.hover()
                    end, opts)
                    vim.keymap.set("n", "<leader>vws", function()
                        vim.lsp.buf.workspace_symbol()
                    end, opts)
                    vim.keymap.set("n", "<leader>vd", function()
                        vim.diagnostic.open_float()
                    end, opts)
                    vim.keymap.set("n", "<leader>vca", function()
                        vim.lsp.buf.code_action()
                    end, opts)
                    vim.keymap.set("n", "<leader>vrn", function()
                        vim.lsp.buf.rename()
                    end, opts)
                    vim.keymap.set("n", "<leader>vrr", function()
                        vim.lsp.buf.references()
                    end, opts)
                    vim.keymap.set("i", "<C-h>", function()
                        vim.lsp.buf.signature_help()
                    end, opts)
                end,
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-buffer",
            "jcha0713/cmp-tw2css",
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
            "kristijanhusak/vim-dadbod-completion",
        },
        -- lazy = false,
        event = "BufEnter",
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            require("cmp-tw2css").setup()

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                -- window = {
                --     completion = cmp.config.window.bordered(),
                --     documentation = cmp.config.window.bordered(),
                -- },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Select,
                    }),
                    ["<C-n>"] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Select,
                    }),
                    ["<C-y>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = {
                    { name = "lazydev", group_index = 0 },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "luasnip" }, -- For luasnip users.
                    { name = "vim-dadbod-completion" },
                    { name = "cmp-tw2css" },
                    { name = "buffer", keyword_length = 5 },
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                        },
                    },
                },

                experimental = {
                    native_menu = false,
                    ghost_text = false,
                },
                formatting = {
                    format = function(entry, vim_item)
                        local lspserver_name = "undefined"
                        if entry.source.name == "nvim_lsp" then
                            -- Display which LSP servers this item came from.
                            pcall(function()
                                lspserver_name = entry.source.source.client.name
                            end)
                        end

                        return lspkind.cmp_format({
                            with_text = true,
                            menu = {
                                buffer = "[buf]",
                                spell = "[spell]",
                                codeium = "[AI]",
                                nvim_lsp = "[" .. lspserver_name .. "]",
                                lazydev = "[api]",
                                path = "[path]",
                                luasnip = "[snip]",
                                ["cmp-tw2css"] = "[tw2css]",
                                ["vim-dadbod-completion"] = "[DB]",
                            },
                        })(entry, vim_item)
                    end,
                },
            })

            -- gray
            vim.api.nvim_set_hl(
                0,
                "CmpItemAbbrDeprecated",
                { bg = "NONE", strikethrough = true, fg = "#BF616A" }
            )
            -- blue
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#5E81AC" })
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
            -- light blue
            vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#81A1C1" })
            vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
            vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
            -- pink
            vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#B48EAD" })
            vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
            -- front
            vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D8DEE9" })
            vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
            vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

            vim.diagnostic.config({
                signs = {},
                virtual_text = true,
            })

            vim.lsp.set_log_level("debug")
            require("hzerbini.lsp")
        end,
    },
}
