return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependecies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        -- event = { "BufReadPost", "BufNewFile" },
        lazy = false,
        priority = 999,
        config = function()
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            ---@diagnostic disable-next-line: inject-field
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }

            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all"
                ensure_installed = {
                    "astro",
                    "blade",
                    "c",
                    "html",
                    "javascript",
                    "lua",
                    "rust",
                    "typescript",
                    "tsx",
                },
                ignore_install = {},

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                indent = {
                    enable = true,
                },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
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

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
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
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ["@parameter.outer"] = "v", -- charwise
                            ["@function.outer"] = "V", -- linewise
                            ["@class.outer"] = "<c-v>", -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true of false
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
    { "nvim-treesitter/playground" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("treesitter-context").setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
            })
        end,
    },
}
