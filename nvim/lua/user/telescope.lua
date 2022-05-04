local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

require('telescope').setup({
	-- defaults = require("telescope.themes").get_dropdown({}),
})
require('telescope').load_extension("fzf")
require('telescope').load_extension("git_worktree")

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>of", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)
keymap("n", "<leader>fc", ":Telescope commands<CR>", opts)
keymap("n", "<leader>fr", ":Telescope resume<CR>", opts)

