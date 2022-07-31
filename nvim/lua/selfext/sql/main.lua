local utils = require("selfext.utils")

function execPgSql()
	local query = utils.getCurrentParagraph()
	local cfg = vim.api.nvim_buf_get_lines(0, 0, 1, false)
	local command = 'psql '..cfg[1]..' -c "'..query..'"'

	local Terminal = require('toggleterm.terminal').Terminal
	local run = Terminal:new({
		cmd = command,
		hidden = true,
		direction = "float",
		close_on_exit = false,
	   on_open = function(term)
		  vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "<cmd>close<CR>", {noremap = true, silent = true})
		end,
	})

	run:toggle()
end

utils.keymap("n", "<S-q>", "<cmd>lua execPgSql()<CR>")

