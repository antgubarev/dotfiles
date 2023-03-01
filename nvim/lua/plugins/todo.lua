local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local todo = require("todo-comments")

todo.setup({
	highlight = {
		keyword = "bg",
	},
	keywords = {
		fix = {
			icon = " ",
			color = "error",
			alt = { "FIXME", "fixme", "BUG", "bug", "FIXIT", "fixit", "ISSUE", "issue" },
		},
		todo = { icon = " ", color = "info" },
		hack = { icon = " ", color = "warning" },
		warn = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		perf = { icon = " ", alt = { "OPTIM", "optim", "PERFORMANCE", "performance", "OPTIMIZE", "optimize" } },
		note = { icon = " ", color = "hint", alt = { "INFO", "info" } },
		test = { icon = "⏲ ", color = "test", alt = { "TESTING", "testing", "PASSED", "passed", "FAILED", "failed" } },
	},
	search = {
		command = "rg",
		args = {
			"--no-heading",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--trim",
			"--glob=!vendor",
			"--glob=!.git",
			"--glob=!node_modules",
		},
	},
})

keymap("n", "<leader>td", "<cmd>TodoTelescope<CR>", opts)
