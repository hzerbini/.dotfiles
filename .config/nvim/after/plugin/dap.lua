local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require('nvim-dap-virtual-text')
-- local theme = require("nord")

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { vim.fn.stdpath("data") .. '/mason/bin/php-debug-adapter' }
}

-- dap.adapters.codelldb = require("rust-tools.dap").get_codelldb_adapter(
--     vim.fn.stdpath("data") .. "/mason/bin/codelldb",
--     vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
-- )

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
    },
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9000
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

--Plugins
dapui.setup()
dap_virtual_text.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

--
-- Highlight Color
--
vim.api.nvim_set_hl(0, 'debugPC', { bg = 000000  }) -- Color of Debug Current Line

--
-- Keymaps
--
vim.keymap.set("n", "<leader>Dc", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>Dk", ":lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<leader>Dl", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>Dj", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<leader>Db", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>DB", ":lua require('dap').set_breakpoint(vim.fn.input('condition: '))<CR>")
vim.keymap.set("n", "<leader>Dlp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>Dr", ":lua require('dap').repl.open()<CR>")
vim.keymap.set("n", "<leader>Du", ":lua require('dapui').toggle()<CR>")

