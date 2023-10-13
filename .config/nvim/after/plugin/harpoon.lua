local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- for i = 1, 9 do
--     vim.keymap.set("n", string.format("<space>%s", i), function() ui.nav_file(i) end)
-- end
vim.keymap.set({ "n", "i" }, "<F11>", function()
	ui.nav_file(1)
end)
vim.keymap.set({ "n", "i" }, "<F4>", function()
	ui.nav_file(2)
end)
vim.keymap.set({ "n", "i" }, "<F5>", function()
	ui.nav_file(3)
end)
vim.keymap.set({ "n", "i" }, "<F6>", function()
	ui.nav_file(4)
end)
