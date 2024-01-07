return {
    "tpope/vim-unimpaired",
    {
        "mbbill/undotree",
        keys = {
            { mode = "n", "<leader>u", vim.cmd.UndotreeToggle },
        },
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },
    {
        "ActivityWatch/aw-watcher-vim",
    },
}
