return {
    "nvim-lua/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-dap.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-q>"] = "smart_send_to_qflist",
                    },
                },
            },
            extensions = {
                file_browser = {
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = false,
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        },
                    },
                },
            },
        })

        telescope.load_extension("file_browser")
        telescope.load_extension("dap")
        telescope.load_extension("git_worktree")
    end,
    keys = {

        -- vim.keymap.set("n", "<leader>ps", function()
        -- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
        -- end)
        { mode = "n", "<leader>fb", "<cmd>Telescope buffers<cr>" },
        { mode = "n", "<leader>fc", "<cmd>Telescope git_commits<cr>" },
        { mode = "n", "<leader>fs", "<cmd>Telescope git_status<cr>" },
        {
            mode = "n",
            "<leader>fe",
            ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
            noremap = true,
        },
        { mode = "n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>" },
        { mode = "n", "<leader>fg", "<cmd>Telescope live_grep<cr>" },
        { mode = "n", "<leader>fh", "<cmd>Telescope help_tags<cr>" },
        { mode = "n", "<leader>f^", "<cmd>Telescope resume<cr>" },
        {
            mode = "n",
            "<leader>fw",
            "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
        },
        {
            mode = "n",
            "<leader>f%",
            "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
        },
        { mode = "n", "<leader>fk", "<cmd>Telescope keymaps<cr>" },
    },
}
