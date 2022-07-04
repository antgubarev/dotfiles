local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local neogit = require('neogit')

neogit.setup({
	disable_commit_confirmation = true,
	disable_context_highlighting = false,
	sections = {
		 untracked = {
			folded = false
		 },
		 unstaged = {
			folded = false
		 },
		 staged = {
			folded = false
		 },
		 stashes = {
			folded = true
		 },
		 unpulled = {
			folded = true
		 },
		 unmerged = {
			folded = false
		 },
		 recent = {
			folded = true
		 },
  },
  integrations = {
		diffview = true  
  },
})

keymap("n", "<leader>gs", "<cmd>Neogit<CR>", opts)
