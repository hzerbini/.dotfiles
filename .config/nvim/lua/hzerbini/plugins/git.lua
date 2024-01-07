return {
    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            local Worktree = require("git-worktree")

            Worktree.setup({
                change_directory_command = "cd", -- default: "cd",
                update_on_change = true, -- default: true,
                update_on_change_command = "e .", -- default: "e .",
                clearjumps_on_change = true, -- default: true,
                autopush = false, -- default: false,
            })
        end,
    },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", "<cmd>Git<cr>" },
            { "<leader>gl", "<cmd>Git log<cr>" },
            {
                "<leader>gp",
                function()
                    vim.cmd.Git("push")
                end,
                buffer = vim.api.nvim_get_current_buf(),
                remap = false,
                ft = "fugitive",
            },
            {
                "<leader>gP",
                function()
                    vim.cmd.Git({ "pull", "--rebase" })
                end,
                buffer = vim.api.nvim_get_current_buf(),
                remap = false,
                ft = "fugitive",
            },
            {
                "<leader>gt",
                ":Git push -u origin ",
                buffer = vim.api.nvim_get_current_buf(),
                remap = false,
                ft = "fugitive",
            },
        },
    },
}
