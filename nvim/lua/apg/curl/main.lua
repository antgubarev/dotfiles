local utils = require("apg.utils")

function execCurl()
	local command = utils.getCurrentParagraph()

	print("c", command)

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

utils.keymap("n", "<S-e>", "<cmd>lua execCurl()<CR>")

