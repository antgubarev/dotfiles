require("toggleterm").setup({
	direction = "float",
})

local k = require("selfext.utils").keymap
k("n", "ttm", ":ToggleTerm<CR>")
k("t", "<C-o>", [[<C-\><C-n>]])
