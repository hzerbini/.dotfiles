local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.emmet_ls.setup{
    capabilities = capabilities,

    filetypes = {
        "astro",
        "css",
        "eruby",
        "html",
        "htmldjango",
        "javascript",
        "javascriptreact",
        "less",
        "pug",
        "sass",
        "scss",
        "svelte",
        "typescript",
        "typescriptreact",
        "vue",
    },
}
