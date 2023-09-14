local ls = require('luasnip')

ls.config.set_config {
    history = true,

    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = false,

    ext_opts = nil,
}


vim.keymap.set({"i", "s"}, "<C-J>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true})

vim.keymap.set({"i", "s"}, "<C-K>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true})

