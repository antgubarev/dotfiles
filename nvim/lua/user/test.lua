vim.api.nvim_set_var("test#strategy", "neovim")
vim.api.nvim_set_var("test#neovim#start_normal", 1)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>ttn", ":TestNearest -v<CR>", opts)
keymap("n", "<leader>ttf", ":TestFile -v<CR>g", opts)
-- keymap("n", "<leader>tts", ":TestSuite -v<CR>g", opts)
-- keymap("n", "<leader>ttl", ":TestLast -v<CR>g", opts)
-- keymap("n", "<leader>ttv", ":TestVisit -v<CR>g", opts)
