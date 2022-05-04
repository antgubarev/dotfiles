local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local neogit = require('neogit')

neogit.setup({
	disable_commit_confirmation = true,
	disable_context_highlighting = true,
})

keymap("n", "<leader>gs", "<cmd>Neogit<CR>", opts)
