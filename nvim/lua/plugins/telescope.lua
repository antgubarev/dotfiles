local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		initial_mode = "insert",
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

k("n", "<leader>tff", ":Telescope find_files<CR>")
k("n", "<leader>tof", ":Telescope oldfiles<CR>")
k("n", "<leader>tlg", ":Telescope live_grep<CR>")
k("n", "<leader>tb", ":Telescope buffers<CR>")
k("n", "<leader>tht", ":Telescope help_tags<CR>")
k("n", "<leader>tts", ":Telescope treesitter<CR>")
k("n", "<leader>tc", ":Telescope commands<CR>")
k("n", "<leader>tr", ":Telescope resume<CR>")
k("n", "<leader>tm", ":Telescope marks<CR>")
