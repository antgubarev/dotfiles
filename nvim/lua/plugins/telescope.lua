local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		initial_mode = "normal",
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.99,
		},
		theme = "vertical",
		vimgrep_arguments = {
			"rg",
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

require("telescope").load_extension("fzf")

local k = require("user.utils").keymap

k("n", "<leader>ff", ":Telescope find_files<CR>")
k("n", "<leader>fb", ":Telescope buffers<CR>")
k("n", "<leader>fl", ":Telescope live_grep<CR>")
k("n", "<leader>fh", ":Telescope help_tags<CR>")
k("n", "<leader>fr", ":Telescope resume<CR>")
k("n", "<leader>fm", ":Telescope marks<CR>")
