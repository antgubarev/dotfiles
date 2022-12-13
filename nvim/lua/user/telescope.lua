local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		initial_mode = "insert",
		layout_strategy='vertical',
		layout_config = {
			width = 0.8,
			height = 0.99,
		},
		theme = "vertical",
		vimgrep_arguments = {
			"rg",
			"-l",
			"--no-heading",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--trim",
			"--glob=!vendor",
			"--glob=!.git",
			"--glob=!node_modules"
		},
	}
}

require('telescope').load_extension("fzf")
require('telescope').load_extension("git_worktree")

local k = require("selfext.utils").keymap

k("n", "<leader>ff", ":Telescope find_files<CR>")
k("n", "<leader>of", ":Telescope oldfiles<CR>")
k("n", "<leader>lg", ":Telescope live_grep<CR>")
k("n", "<leader>fb", ":Telescope buffers<CR>")
k("n", "<leader>fh", ":Telescope help_tags<CR>")
k("n", "<leader>ft", ":Telescope treesitter<CR>")
k("n", "<leader>fc", ":Telescope commands<CR>")
k("n", "<leader>fr", ":Telescope resume<CR>")
k("n", "<leader>fm", ":Telescope marks<CR>")
