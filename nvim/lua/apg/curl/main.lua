local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

function execCurl()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local lines = vim.api.nvim_buf_get_lines(0, row-1, vim.api.nvim_buf_line_count(0), false) or {""}
	local commandLines = ""
	for k,v in pairs(lines) do
		if v == "" then
			commandLines = vim.api.nvim_buf_get_lines(0, row-1, row+k-1, false)
			break
		end
	end

	local command = table.concat(commandLines, " ")
	command = command:gsub('[%c]', '')
	
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

keymap("n", "<S-e>", "<cmd>lua execCurl()<CR>", opts)

