local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").astro.setup({
    capabilities = capabilities,

    init_options = {
        typescript = {
            serverPath = vim.fn.stdpath("data")
                .. "/home/zerbini/.local/share/nvim/mason/packages/astro-language-server/node_modules/typescript/bin/tsserver",
        },
    },
})
