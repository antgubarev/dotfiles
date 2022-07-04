local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local todo = require('todo-comments')

todo.setup({
	highlight = {
		keyword = "bg",
	},
})

keymap("n", "<leader>td", "<cmd>TodoTelescope<CR>", opts)
