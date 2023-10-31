require("neorg").setup({
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.autocommands"] = {}, -- Adds pretty icons to your documents
        ["core.ui"] = {}, -- Adds pretty icons to your documents
        ["core.queries.native"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/Documents/Personal/notes",
                },
            },
        },
        ["core.integrations.treesitter"] = {},
    },
})
