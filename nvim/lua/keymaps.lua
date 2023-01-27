local k = require("user.utils").keymap

--Remap space as leader key
k("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
k("i", "jj", "<Esc>")

k("n", "<S-l>", ":bnext<CR>")
k("n", "<S-h>", ":bprevious<CR>")

-- save and quit
k("n", "<leader>s", ":write<CR>")
k("n", "<leader>S", ":wall<CR>")
k("n", "<leader>w", ":bd<CR>")
k("n", "<leader>W", ":bd!<CR>")

-- clipboard
k("v", "y", '"+y')
k("v", "Y", '"+Y')
k("n", "<leader>cp", ":let @+=expand('%:p')<CR>")

-- search
k("n", "<leader>nn", ":nohlsearch<CR>")
k("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')
