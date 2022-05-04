local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

require'nvim-tree'.setup{
	actions = {
      open_file = {
      	quit_on_open = true,
      },
	},
}

keymap("n", "<leader>vv", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", opts)

