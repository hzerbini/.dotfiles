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

vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {})
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", {})
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", {})
vim.keymap.set(
    "n",
    "<leader>fe",
    ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
    { noremap = true }
)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})
vim.keymap.set("n", "<leader>f^", "<cmd>Telescope resume<cr>", {})
vim.keymap.set(
    "n",
    "<leader>fw",
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
    {}
)
vim.keymap.set(
    "n",
    "<leader>f%",
    "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
    {}
)
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", {})
