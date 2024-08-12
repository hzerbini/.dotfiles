return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "BufEnter",

    config = function()
        local ls = require("luasnip")
        ls.log.set_loglevel("info")

        ls.config.set_config({
            history = true,

            updateevents = "TextChanged,TextChangedI",

            enable_autosnippets = false,

            ext_opts = nil,
        })

        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })
    end,
    keys = {
        {
            mode = { "i", "s" },
            "<C-J>",
            function()
                local ls = require("luasnip")
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end,
            silent = true,
        },

        {
            mode = { "i", "s" },
            "<C-K>",
            function()
                local ls = require("luasnip")
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end,
            silent = true,
        },

        {
            mode = { "i", "s" },
            "<C-L>",
            function()
                local ls = require("luasnip")
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end,
            silent = true,
        },
    },
}
