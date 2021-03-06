local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("i", "jj", "<Esc>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- save and quit
keymap("n", "<leader>s", ":write<CR>", opts)
keymap("n", "<leader>S", ":wall<CR>", opts)
keymap("n", "<leader>w", ":bd<CR>", opts)
keymap("n", "<leader>W", ":bd!<CR>", opts)

-- clipboard
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>Y", '"+Y', opts)
keymap("n", "<leader>cp", ":let @+=expand('%:p')<CR>", opts)

-- search
keymap("n", "<leader>nn", ":nohlsearch<CR>", opts)
keymap("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>", opts)

-- terminal
keymap("t", "<C-o>", [[<C-\><C-n>]], opts)

