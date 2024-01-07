return {
    {
        "theprimeagen/harpoon",
        keys = {
            { mode = "n", "<leader>a", require("harpoon.mark").add_file },
            { mode = "n", "<C-e>", require("harpoon.ui").toggle_quick_menu },
            {
                mode = { "n", "i" },
                "<F11>",
                function()
                    require("harpoon.ui").nav_file(1)
                end,
            },
            {
                mode = { "n", "i" },
                "<F4>",
                function()
                    require("harpoon.ui").nav_file(2)
                end,
            },
            {
                mode = { "n", "i" },
                "<F5>",
                function()
                    require("harpoon.ui").nav_file(3)
                end,
            },
            {
                mode = { "n", "i" },
                "<F6>",
                function()
                    require("harpoon.ui").nav_file(4)
                end,
            },
        },
    },
}
