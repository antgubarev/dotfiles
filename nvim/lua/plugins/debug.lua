local dap = require("dap")
local dapui = require("dapui")
local gdap = require("dap-go")
--- local vtdap = require("nvim-dap-virtual-text")

gdap.setup({})
dapui.setup({})
-- vtdap.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local k = require("user.utils").keymap
k("n", "<F5>", ":lua require'dap'.continue()<CR>")
k("n", "<F3>", ":lua require'dap'.step_over()<CR>")
k("n", "<F2>", ":lua require'dap'.step_into()<CR>")
k("n", "<F12>", ":lua require'dap'.step_out()<CR>")
k("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
k("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
k("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
k("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
k("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
