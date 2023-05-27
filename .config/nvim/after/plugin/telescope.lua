local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
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
}

telescope.load_extension "file_browser"
telescope.load_extension('dap')

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n','<leader>fb', "<cmd>Telescope buffers<cr>", {})
vim.keymap.set('n','<leader>fc', "<cmd>Telescope git_commits<cr>", {})
vim.keymap.set('n','<leader>fe',':Telescope file_browser path=%:p:h select_buffer=true<cr>',{ noremap = true })
vim.keymap.set('n','<leader>ff', "<cmd>Telescope find_files hidden=true<cr>", {})
vim.keymap.set('n','<leader>fg', "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set('n','<leader>fh', "<cmd>Telescope help_tags<cr>", {})
vim.keymap.set('n','<leader>fk', "<cmd>Telescope keymaps<cr>", {})

