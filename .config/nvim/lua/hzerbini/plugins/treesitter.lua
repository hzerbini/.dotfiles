return {
    { "nvim-treesitter/playground" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "bufreadpost", "bufnewfile" },
        opts = {
            enable = true, -- enable this plugin (can be enabled/disabled later via commands)
            max_lines = 0, -- how many lines the window should span. values <= 0 mean no limit.
            min_window_height = 0, -- minimum editor window height to enable context. values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- maximum number of lines to collapse for a single context line
            trim_scope = "outer", -- which context lines to discard if `max_lines` is exceeded. choices: 'inner', 'outer'
            mode = "cursor", -- line used to calculate context. choices: 'cursor', 'topline'
            -- separator between context and content. should be a single character string, like '-'.
            -- when separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- the z-index of the context window
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/playground",
            "nvim-treesitter/nvim-treesitter-context",
        },
        event = { "bufreadpost", "bufnewfile" },
        -- lazy = false,
        -- priority = 999,
        config = function()
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            --@diagnostic disable-next-line: inject-field
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/emranmr/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }

            parser_config.gotmpl = {
                install_info = {
                    url = "https://github.com/ngalaiko/tree-sitter-go-template",
                    files = { "src/parser.c" },
                },
                filetype = "gotmpl",
                used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
            }

            require("nvim-treesitter.configs").setup({
                -- a list of parser names, or "all"
                ensure_installed = {
                    "astro",
                    "blade",
                    "c",
                    "go",
                    "gomod",
                    "gosum",
                    "gotmpl",
                    "javascript",
                    "lua",
                    "php_only",
                    "rust",
                    "sql",
                    "tsx",
                    "typescript",
                },
                ignore_install = {},

                -- install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- automatically install missing parsers when entering buffer
                -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
                auto_install = false,

                indent = {
                    enable = true,
                },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- using this option may slow down your editor, and you may see some duplicate highlights.
                    -- instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                -- incremental_selection = {
                --     enable = true,
                --     keymaps = {
                --         init_selection = "gnn",
                --         node_incremental = "grn",
                --         scope_incremental = "grc",
                --         node_decremental = "grm",
                --     },
                -- },
                textobjects = {
                    select = {
                        enable = true,

                        -- automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- you can use the capture groups defined in textobjects.scm
                            ["am"] = "@function.outer",
                            ["im"] = "@function.inner",

                            ["af"] = "@call.outer",
                            ["if"] = "@call.inner",

                            ["a/"] = "@comment.outer",
                            ["i/"] = "@comment.inner",

                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",

                            ["as"] = "scope",

                            ["a="] = "@assignment.outer",
                            ["i="] = "@assignment.inner",
                            [",="] = "@assignment.lhs",
                            [".="] = "@assignment.rhs",

                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",

                            ["ai"] = "@conditional.outer",
                            ["ii"] = "@conditional.inner",

                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                        },
                        -- you can choose the select mode (default is charwise 'v')
                        --
                        -- can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'v', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ["@parameter.outer"] = "v", -- charwise
                            ["@function.outer"] = "v", -- linewise
                            ["@class.outer"] = "<c-v>", -- blockwise
                        },
                        -- if you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true of false
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
}
