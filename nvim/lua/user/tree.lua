local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

require'nvim-tree'.setup{
	actions = {
      open_file = {
      	quit_on_open = true,
      },
	},
	filters = {
		dotfiles = true,
	},
	view = {
		side = 'right',
		width = 90,
	},
}

keymap("n", "<leader>vv", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", opts)

