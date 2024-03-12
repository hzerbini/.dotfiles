return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local dap_virtual_text = require("nvim-dap-virtual-text")
        local dap_go = require("dap-go")

        dap_go.setup({
            delve = {
                path = vim.fn.stdpath("data") .. "/mason/bin/dlv",
            },
        })

        dap.adapters.dart = {
            type = "executable",
            command = "dart",
            -- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
            args = { "debug_adapter" },
        }

        dap.adapters.php = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/php-debug-adapter",
            -- args = { vim.fn.stdpath("data") .. '/mason/bin/php-debug-adapter' }
        }

        -- dap.adapters.codelldb = require("rust-tools.dap").get_codelldb_adapter(
        --     vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        --     vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
        -- )

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                args = { "--port", "${port}" },
            },
        }

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for Xdebug",
                port = 9003,
                log = true,
                pathMappings = {
                    ["/var/www"] = "${workspaceFolder}",
                },
            },
        }

        dap.configurations.blade = dap.configurations.php

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input(
                        "Path to executable: ",
                        vim.fn.getcwd() .. "/target/debug/",
                        "file"
                    )
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        dap.configurations.dart = {
            {
                type = "dart",
                request = "launch",
                name = "Launch Dart Program",
                -- The nvim-dap plugin populates this variable with the filename of the current buffer
                program = "${file}",
                -- The nvim-dap plugin populates this variable with the editor's current working directory
                cwd = "${workspaceFolder}",
                args = { "--help" }, -- Note for Dart apps this is args, for Flutter apps toolArgs
            },
        }

        --Plugins
        dapui.setup()
        dap_virtual_text.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        --
        -- Highlight Color
        --
        vim.api.nvim_set_hl(0, "debugPC", { bg = 000000 }) -- Color of Debug Current Line
    end,
    keys = {
        { "<F12>", ":lua require('dap').continue()<CR>" },
        { "<F8>", ":lua require('dap').step_out()<CR>" },
        { "<F7>", ":lua require('dap').step_into()<CR>" },
        { "<F9>", ":lua require('dap').step_over()<CR>" },
        { "<leader>Db", ":lua require('dap').toggle_breakpoint()<CR>" },
        {
            "<leader>DB",
            ":lua require('dap').set_breakpoint(vim.fn.input('condition: '))<CR>",
        },
        {
            "<leader>Dlp",
            ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        },
        { "<leader>Dr", ":lua require('dap').repl.toggle()<CR>" },
        { "<leader>Du", ":lua require('dapui').toggle()<CR>" },
        { "<leader>Dt", ":lua require('dap-go').debug_test", ft = "go" },
    },
}
