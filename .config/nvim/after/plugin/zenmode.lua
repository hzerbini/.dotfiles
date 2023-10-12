require("zen-mode").setup({
    window = {
        width = 1,
        options = {
            number = true,
            relativenumber = true,
        },
    },
    on_open = function()
        vim.opt.colorcolumn = "80"
    end,
    on_close = function()
        vim.opt.colorcolumn = nil
    end,
})

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
end)
