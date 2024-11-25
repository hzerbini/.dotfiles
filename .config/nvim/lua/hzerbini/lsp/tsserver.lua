-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").ts_ls.setup({
    capabilities = capabilities,
    cmd = { "/home/zerbini/.local/share/nvim/mason/bin/typescript-language-server", "--stdio" },
    -- Utilizado para fazer com que o ts ls funcione junto do volar, porem ainda n consegui fazer funcionar
    init_options = {
        {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = {
                "vue",
            },
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        -- "vue",
    },
})
