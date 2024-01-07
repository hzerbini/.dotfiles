return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup({
            window = {
                width = 1, -- width of the Zen window
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

            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus'
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0, -- turn off the statusline in zen mode
                },
                -- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = true }, -- disables git signs
                tmux = { enabled = true }, -- disables the tmux statusline

                -- this will change the font size on alacritty when in zen mode
                -- requires  Alacritty Version 0.60.0 or higher
                -- uses `alacritty msg` subcommand to change font size
                alacritty = {
                    enabled = true,
                    font = "16", -- font size
                },
            },
        })
    end,
    keys = {
        {
            "<leader>zz",
            function()
                require("zen-mode").toggle()
                vim.wo.wrap = false
            end,
        },
    },
}
