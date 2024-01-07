return {
    "Exafunction/codeium.vim",
    config = function()
        vim.g.codeium_disable_bindings = 1
    end,
    keys = {
        {
            mode = "i",
            "<C-Tab>",
            function()
                return vim.fn["codeium#Accept"]()
            end,
            expr = true,
        },
        {
            mode = "i",
            "<c-;>",
            function()
                return vim.fn["codeium#CycleCompletions"](1)
            end,
            expr = true,
        },
        {
            mode = "i",
            "<c-,>",
            function()
                return vim.fn["codeium#CycleCompletions"](-1)
            end,
            expr = true,
        },
        {
            mode = "i",
            "<c-x>",
            function()
                return vim.fn["codeium#Clear"]()
            end,
            expr = true,
        },
    },
}
