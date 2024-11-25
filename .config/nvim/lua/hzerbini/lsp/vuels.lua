-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").volar.setup({
    capabilities = capabilities,
    init_options = {
        vue = {
            hybridMode = false,
        },
    },
})
