require("toggleterm").setup({
	direction = "tab",
	close_on_exit = false,
	on_open = function(term)
		vim.cmd("startinsert!")
	end,
})

local k = require("user.utils").keymap
k("n", "ttm", ":ToggleTerm<CR>")
k("t", "<C-o>", [[<C-\><C-n>]])
