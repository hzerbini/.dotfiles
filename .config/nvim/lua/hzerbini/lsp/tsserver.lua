-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").ts_ls.setup({
    capabilities = capabilities,
    cmd = { vim.fn.stdpath('data') .. "/mason/bin/typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
})
