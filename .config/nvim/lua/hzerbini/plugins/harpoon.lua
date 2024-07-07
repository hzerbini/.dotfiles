return {
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = {
            {
                mode = "n",
                "<leader>a",
                function()
                    require("harpoon"):list():add()
                end,
            },
            {
                mode = "n",
                "<C-e>",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon.list())
                end,
            },
            {
                mode = { "n", "i" },
                "<F11>",
                function()
                    require("harpoon"):list():select(1)
                end,
            },
            {
                mode = { "n", "i" },
                "<F4>",
                function()
                    require("harpoon"):list():select(2)
                end,
            },
            {
                mode = { "n", "i" },
                "<F5>",
                function()
                    require("harpoon"):list():select(3)
                end,
            },
            {
                mode = { "n", "i" },
                "<F6>",
                function()
                    require("harpoon"):list():select(4)
                end,
            },
        },
    },
}
